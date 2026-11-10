Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314145;
	b=FRYwkVYByM0lURCbteuxoU7B/vz0pum1gbo61vge94tWO/41DFyGyK0nJrirAGdOsohd
	 qYbzNmwcld4YQ3ZGocXZxNkyZJtETBsOptNi8GDUf2/s+v1GjoYBCI4qqj56OdGERczL/
	 bg04uLRmCRlBA4vSYVoTmVvSGRqxHzA5LEbgvi+37tRmkHY0SRCSOu24NJwtH5BH6x7mO
	 /0021jmt6s12k8YrLQyGElDspvRzT5COoPanckbShtv9ihxlZQSdisPl2kiC/E8yDCXQM
	 kLre8QQSQbPqqc8gZ6exK17vgYVxplzDKXIVA77GTtIMd9HPVDvLuRFCq0jK95qkICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314145;
	h=Received:DKIM-Signature:Message-ID:Date:From:To:Subject:In-Reply-To:
	 References:Cc:Content-Transfer-Encoding;
	bh=fluuu4xEYv/Da1IY1IuAuVNAQQZsRT3U3HedNDF+t1A=;
	b=SWWepgead0nsLgMvFyuAP8OGIqBKk5oUN1MFoJ8y+GJAB/YC4AvBmryPAkRTgm3iNyo0
	 ggcKCqXEXEmO/pyCezIYfFdIZIJILfaonsY7VgBIS0iTIi3b8dBOtRUSLRBZRzLknAMoK
	 q9MuyS8QKBnWZk9bkq7fDNX17yLOQRpvQ+pkXuUTCiMAlxxLp0LtXWE1BRLlnCZS20oih
	 MLiWcb8oLtptn0b/NmNZuxrnZpJlQ2+tBZvotRlbZ4W57FN2z3BQB/PfHwTyvJ211x2Jp
	 frwKbttRoQNvuqt5IQxdBHmD4xi8a+GepWPWtA9Cqp0SuFvuZXG5nlVlReZAH4axbGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ME3kCSzS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173E606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 12:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ME3kCSzS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F601F0089F;
	Tue, 10 Nov 2026 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314145;
	bh=fluuu4xEYv/Da1IY1IuAuVNAQQZsRT3U3HedNDF+t1A=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=ME3kCSzSFXFuLSjcEwqi8H5Fy0+29inmvRFL7i8ZeewELyg7qXBAsUNTX01icopjy
	 5ibbwnk4T+GYh3gc0yaHLTl1w/U5dffr5xHLg1tpF0p7XzA18izSirmBw+HTP45s+w
	 49RjvO0X2n0ilcjpoGpu6qK7xyiPSqk0zaljMLrnWoBZmcOUMwT86cfJzvlXd6Yp6W
	 or+SBUEbdOfcLZ/5oU1SRPxSmAjN2VWb3DCKfHLEUn0yJkQbmGWr5WCGyVdw6hHI6/
	 ojRiBogxyNuraxBtIFU/EvDuOdp9iFsTcR5ifCvw89wmCnT1tG7LgE7/cL/HWCCy7S
	 H1fy+vuUlT2Lg==
Message-ID: <b7ef68866304a49acfa0be3e1e4078cd@kernel.org>
Date: Tue, 10 Nov 2026 12:35:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH 0/5] drm/amdgpu,radeon: Inline drm_crtc_init()
In-Reply-To: <20261110120326.538252-1-tzimmermann@suse.de>
References: <20261110120326.538252-1-tzimmermann@suse.de>
Cc: airlied@gmail.com, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, sashiko-reviews@lists.linux.dev, simona@ffwll.ch, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list

On Tue, 10 Nov 2026 12:53:26 +0100, Thomas Zimmermann wrote:
> The helper drm_crtc_init() sets up a CRTC with a primary plane for
> non-atomic mode setting. Only drivers for some AMD hardware still
> use it.
> 
> Inline drm_crtc_init() into amdgpu and radeon and remove it from
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
