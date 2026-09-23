Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B633938C
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162848; cv=pass; b=c4Xw9FOvQ6AjElLgnWZPOqadRTha7L2U17CXom1GFgatDtI9yMCHQPxkCu1a2MjK2QTfxSdxtZMzYHstwxY/fJrw4YPOLl0RDpL1eAVWYlJJwP9kDUQJDGK10C02JgaliOFZvVxjLwRTryX/ibEtt7RRhNa3AMfpUWU4MMZ8OSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162848; c=relaxed/simple;
	bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d5i3jRc2TKG6/p/sv96DCutEIXS61dtRQfEYUWL2GRvM6dzj/odsEVRMagE6Opa1TCR1s3KHN2uWnO3nLFd5YNDk2wxj+xaBwgpcWz9nWlzaDoewjjP3N/AieTYhit9B5lI5yf7Ublo5CFcT8cXZ/vbkztzVFvYBga7vNegRo0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrLQgqXs; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrLQgqXs"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-5308fc4b716so5656431cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 04:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162843; cv=none;
        d=google.com; s=arc-20260327;
        b=XtqZADIgIkb40Um6ekQQtnrAJSVvLIqS8CSN6ZICyvbtmr+1KDWNwr/TVDPy0gxzRi
         NVhz0Vk3Z9/U7KnouCMCzrlmoHbNU4DWspEhvjXq2sMMVePR+YRVrGt/vReLjHyDT2rL
         FBlSRVHYqPyg3EAjBlItY0U97xsIPawpQyHjCoUEqT8pGY+JbEtFfScpRM9s3/6h8GGY
         jp22//sWC0y0cXtUIV6x0zP8rrEBrZxftI6jLLAcTqlyT5T/gtJdOXRwjzlkm6dpW+PH
         +FQhv9heW03H6KpczjmkBIqEIkeXb0xKoY7DM/BwsC+9+3NQbe9g/nv3JspdcYnqiw7H
         V66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
        fh=i0J7Vrf1Dtak+VezafgJcq22zN+YUptv8kxlFHMB4U0=;
        b=PgrG76AXtZYQUUIeDuI1j05YAGk890YWfswMT7dRb79phQkyG3/te15n//WM1R+7O3
         ifAXfKvDz1UHO2E0m/Ic4WXpCd+4goSpnVpIy7A8cGMjI532UEZMF7nhb4q+KBRtDKKO
         rtnv39wLnm7lnHtxWk7r4R7nwFOXwxruFEsbNenjUGpCHoMXj+9N+Zb80VgxXhgcD7Y6
         EbDm0+ncrHyxRqjkj4XXyYA+23mMQ0r75SWej1WY4v+KE0i6r4MlzcCE1IcQDCkWLYOc
         vbQpyTm/SIrkBnyIepxx1o/UlIbX8yoJ2AV4/bekjPzsILL+62wB0AwHMdESlIokw3Wn
         q0SA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162843; x=1790767643; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
        b=HrLQgqXsWo+giaxxLeRyhsjrjdfILyHa+KCEtPNAC8IfViPilflPl08f5tiEBpRRL6
         U5bP67RdVVLcHqWcrxsndvHkZjZwAqz/AReojVPPKcliWq8EHOQvnqvV20mADSD3EzX3
         nT8ATRTpOGcClxkL/a/VLl0y9dlWp5lvHwOwa2t+4fzWuuSy37ukmUDQ95ZUB2HTEatp
         OFBubIQ0mfOdjQbUjCX4RrJona3uBvjd8rLIHIm4h7lVXhTbIoMCcSe8OuO2h6RSqtoa
         5tFC3hwZpkffhDLx7jv9hruSzf6x3l7ZYTXoGWa8cggXFRbs57UGMfPKcqLQG1t7AN3v
         v64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162843; x=1790767643;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
        b=dR9W874pt/gT4rqEWYjAyDkkzS7oStT+J3Jw7yW2qDnM8FqOBFp8Zia6YUYJ6EXYGf
         HnQbVeeL97cpVr9cmvc3zRM7IZck2ynMKObbR2ekcR3P49AH7L0jNF8iM3Y//ieaO9bh
         11cM8eGcleiFPRovjVSehmVOhbnwAPx8vB0XL63dWiXBk9DcPdGHj7ur1+/Tf/fMAtjv
         2DpA573bReit5vOy3ZK3GYmNIytdqPxAPVRSgW/fd+4npd5FeDB+hQ3eWAtO6kzO8Kge
         r3kQ8YPARyJAdVIahtcAElGdzRYP3yFiL1GZM7EG7cqmRxiusDwCOiqQ1te9T419u62U
         jXXA==
X-Gm-Message-State: AFuF++mc3TavpcFIYvkrJFa5mstWJgeuGdk6B5y97FuNnmluZZ2YfuXT
	dXMXugpI8WRETTG8SLEOmF2wNSerIuySubkfxqUR7wsAjziHA6WaZXGv0K2ZT+jWq6GNKhMKYIF
	TtaYdrcBRO7mCpFd6NmB3zWrJ5HwFiMrlTGytxLvna8qw
X-Gm-Gg: AYBFou26X7l1V30UYlQfZe6AbQnr/jumLQdMS2gKjpZTsiMtDhH622T+0fC7ImeVN8v
	s6sL00vVp6bAgdYRViZ20sXZIT5MTwa676C4bFIVsmL7SRNBB0x8P7fH6RtVbeLalaNsGXRZ5N+
	6pyUNUR3yVIZ0OCaeOLk1f5mDHyj8gMGjBXbcouv6BBlnziLW7BcSi5EZEmCBqUWxv95daussh2
	yY4rS5R2AkmAphfIlr0KaocargA91PlQbkKTbHw98s+3bYg4OEYSgJQQ8SVW8tpl206dMLrUxNr
	yST5ae79FtLD7sNTyTQQYfZd4u8ytqo4avqUpHv+ei1RrGv9H+Y1A19YFg==
X-Received: by 2002:a05:620a:2a07:b0:937:2d64:57ae with SMTP id
 af79cd13be357-93c24f0fcafmr343702985a.0.1790162842832; Wed, 23 Sep 2026
 04:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105757.260-1-anykey196@gmail.com> <20260923110700.C331F1F00898@smtp.kernel.org>
In-Reply-To: <20260923110700.C331F1F00898@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:27:11 +0500
X-Gm-Features: AclHuK_8X2-F2vjZ_B5cnOVtrt17GVI8L-zKCbR7jOO-TwWiv5aNx_f1whnBR8g
Message-ID: <CANHPwATb77aewMK=_twoPkUcWy44M-=jcAN9XfeZwetJY=nbTw@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - add AXP313a support
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is already addressed in v2 [1]: the AXP313a no longer reuses
axp20x_info. It has its own axp313a_info without start-up/shutdown
times, and the startup/shutdown attributes are hidden through
is_visible(), so they are not created and no out-of-range access to
AXP20X_PEK_KEY happens.
