Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7523D1CA8
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 06:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418586; cv=none; b=beIcC0arJJCmHuRkeUcgPB5jFSIMUJrg4h+D87FlewoFXYFUDTdIodZiSMxle1+EY4mNNwGndKOc98Tr7LvsrOx4wZ8nu9nEtOaLHOiluOsIgqI6/R73vz1sFPejwFF4lavfmP6Fst8r/JEt3pN2o50GqtfUfUp6IhY3tZwICs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418586; c=relaxed/simple;
	bh=QvVM54NpkoK3YnFwZ+xjzZxlVOYfW2Xw5XMmA0hckxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gh1/ch8X0qpMaQsLnAIh6fy4H0U4QmoPEKNpnvtqmxEFNVP+azBtk/2X/PceW7RZA5zmrStn3XWebKhDNGvjOGJ2CsYRDP3bk3i+zVz42T80hbFWbNZQ0OUmqCYaxHreigNhxStYgOthKnwHDrYlHx3Cerx1IiXiUXqIAvPV/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aQpMkBkg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jfbl4mRk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RBzedHud; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iWnwX9CL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aQpMkBkg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jfbl4mRk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RBzedHud";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iWnwX9CL"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9AAD821E86;
	Thu,  3 Sep 2026 06:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788418574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iMe8QpXxJI9lslA9bVylRc6cUbYfr4iCuVypi9ek89s=;
	b=aQpMkBkgkaae1HYwyzWJUjas5FgMISSIYdipHsR6hGYLEk8MwWIy2ijohwv/1B+SzUJdJ4
	5GnY/gwcdlEfuOtobzTU0pc0oyeiWslFB3qYky1YSLH1cB7l6UbOMnLBRIZJSw/8DhkRgp
	rK5hpWTlIDOodYxmyvlP9fglOzhjt9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788418574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iMe8QpXxJI9lslA9bVylRc6cUbYfr4iCuVypi9ek89s=;
	b=Jfbl4mRkck7zPj0FyhOztoWwqddOdRCAlT5Ga/yAiTayxLMs8P5kvZ3ll566W658SQSwoE
	bXdtXUVR+lzNOGCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788418570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iMe8QpXxJI9lslA9bVylRc6cUbYfr4iCuVypi9ek89s=;
	b=RBzedHud7HZBZq3IZfo/n2x++XWKhaV9lR6zsxnBSQrM0xfHlqlFRqObBup1+LekpBLHlz
	xFbWAyUPQUd/J4F/HVJL4KdBTK/cjD8V1bL3ZwMBXofgo4vSeUkaYDsZVdKVcRGMFJVj32
	qY4S/XwJMd/4kXMFfOWWT72JoHdu+dI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788418570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iMe8QpXxJI9lslA9bVylRc6cUbYfr4iCuVypi9ek89s=;
	b=iWnwX9CLeA1vNvOHhnQvZsGnnsNC2WqJxhMc3UwsXNtOnHbwdROFjfOHt6FwHWV7pixD2f
	T+ZI0q7zxsjJwUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4026F136E6;
	Thu,  3 Sep 2026 06:56:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TIPYDQoamWqWSgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 03 Sep 2026 06:56:10 +0000
Message-ID: <6a86569b-176e-4959-8287-c15ae6c184dd@suse.de>
Date: Thu, 3 Sep 2026 08:56:09 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atomic: Set plane-state pixel_blend_mode to default
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, daniels@collabora.com, leandro.ribeiro@collabora.com,
 pekka.paalanen@collabora.com, lowry.li@arm.com
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
References: <20260901122731.83854-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20260901122731.83854-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,collabora.com,arm.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,intel.com:email,suse.de:mid,suse.de:email,suse.com:url,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO



Am 01.09.26 um 14:25 schrieb Thomas Zimmermann:
> Initialize the plane state's pixel_blend_mode value to the plane
> property's default value. Resolves an inconsistency on planes that
> do not support PREMULTI.

Never mind. It's a duplicate of

https://lore.kernel.org/dri-devel/2026090341-appraisal-jot-6aec@gregkh/T/#m10bbb3677bbc65b9f358751f174a5fd3d2d319e7

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> It's not clear what Fixes should point to, so I picked the commit that
> introduced the stricter validation of the blend-mode property.
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index d90d1d7c9cf9..0325caee528a 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -278,7 +278,13 @@ void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
>   	plane_state->rotation = DRM_MODE_ROTATE_0;
>   
>   	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
> -	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;
> +
> +	if (plane->blend_mode_property) {
> +		if (!drm_object_property_get_default_value(&plane->base,
> +							   plane->blend_mode_property,
> +							   &val))
> +			plane_state->pixel_blend_mode = val;
> +	}
>   
>   	if (plane->color_encoding_property) {
>   		if (!drm_object_property_get_default_value(&plane->base,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)


