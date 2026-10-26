<?php
defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Plugin\CMSPlugin;

class PlgSystemLogoutRedirect extends CMSPlugin
{
    public function onUserAfterLogout($user, $options = array())
    {
        $app = Factory::getApplication();

        // Only redirect on frontend
        if ($app->isClient('site'))
        {
            $app->redirect('https://www.staudenschlacht.ch/');
        }
    }
}
