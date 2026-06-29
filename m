Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB63F929C
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723374; cv=none; b=JOryWMsPojsaDdblAdHUgVIUQLHbDrZhWGvLF+dRGi61fwKsftOHpvQMLZQoPpXTRCwq8RsbTakjAWUXNHfSun3QRpK+BSaWBSk014YfRrRluzqsCFGAllqs77Ji2PnaV3qlw5rYexO4Ymukr4nBNOTtYisGk/LEGZHvTNAHbMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723374; c=relaxed/simple;
	bh=rF6EBn7rMd5aRx6RV1AjA5XWgGQqhiwjIgHMv70JtVI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N+53yPnE1jbEZY2mvn0Y0OQhfea/BgXVMM9XQYJy3iD7BLLbj6UqCE3wPdy7mn3wiDoDJ/eX3hDxCLQRmdBlDV+gnlHQKk9FgG0mQdyfWCUyS8AvmitX6mgYeqnJiieAXBEyqUxynwmg8UDsz8YawOkBUCaBcQ+Yi2l3mFoPU1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M7Z6AdPE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M7Z6AdPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782723372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oovJIoNGk4eGagKRDaw9pqXMujhus9ut370XvRbtgL4=;
	b=M7Z6AdPErOE6xR+OJxA2ArXOEg4HZmpwqrBHSmSq2Ua03ZGZLx0lUmYwksl6mvSBNicRQ0
	pH8kaTHOZ93TsNid8b5bng7qAwiLmVBl8GPKMtuXfDka7fh0s4oQp1gGWFgwwglkKSS14a
	FBsGkCeWjVVMt8WrEJKeexDicuP6Hbg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-Ea2AZyjEOSOkok86HqsGuw-1; Mon, 29 Jun 2026 04:56:09 -0400
X-MC-Unique: Ea2AZyjEOSOkok86HqsGuw-1
X-Mimecast-MFC-AGG-ID: Ea2AZyjEOSOkok86HqsGuw_1782723368
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45f3d008865so2360513f8f.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 01:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723368; x=1783328168;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oovJIoNGk4eGagKRDaw9pqXMujhus9ut370XvRbtgL4=;
        b=Y/Z757+xZbN8PY+KFPV+2abF9JBfhz9Z2x96i3xjAZRVQmgKWsdGY91xoLLhg1KME4
         bnPCXFTJGlnKLVAULnLGhpyXT7UIzoBNRhG2BoLgg9LBswQloq+HGWKLnDacam9taGV6
         /V2eDJk6gW9mdWzNMXSvMFnyX5gpJghbOhhzY6zfXy2/a7vd1EJ5RkAk18zDJsiLtAUb
         5uNpfmhCSwzboCdIEAYVfewr2Re+YKNt4jQtVpy/Fi0kvAsu7xSoufR+bsN6pGxu49tl
         g0ulhDHw8CfIV/4/EQoRL0cDpUfv01taES4Rm3xNb9PrtVpILkAletRhP4xVERQFGL4q
         uM1A==
X-Forwarded-Encrypted: i=1; AHgh+RoQx2EdIJaOSlD3yCwcAQGeGQVYNmQJYUvtNzHZOLMPhnyNy2+DG9gTmF9fdmGKQI3PFW03Ct6rPW5VsfYE5yc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx0tzWkrnqdl4CUfmqn/62InNoj78XQ9/jHjezY/+v3PZc+yBV
	nl9oJl6d/gubS6/43G00/a4LAV4N6LOk66RsfbRBQDubeZHk6AUqsCcpBVpFiGWJGLwn1TNBjyp
	M5scZ2fHhgz+BW/8h9IPUgjtT/McGSKYga/7JuQOm9SeicyNN4SIBSAzyPIsbwRKGZ9MU5g==
X-Gm-Gg: AfdE7clbue/gCj411a5MFFSvM4JcXAOJXkQNLTpM5xTtUeQnbsfYnPyhCiKEe6o6z+9
	OgFpwziYREDjatmYneqTrbXSE862DiVpqX+/ZfNV70DRIn1K277RGEURymJT+JBrCSrUNJvIcvJ
	DtAAFtVbGn2IRrbjaGK5lYnUMU59H0cC1SWRsuNvUETuqWwg2snAYuuniNr/BDGl1AlfwD6zLr6
	ugWvY7FZoEHBeHmS6dqPaQ4ZGMWpO6+/r3fJERUKR9BR7kgF2AFF4hHuQn9zXMuXJ0c5sb+pd9s
	ZeogipedCrH8wNoKMtGYG9vawdin5j1efwPWH9jA18/7Qj/dRz9sPauiYCIhYNSdXY5pOZ1hRO9
	rrmrIlUFxmu/bTTG+ymIrwgU7M390viUvbAdbiR3qAkORn+mVyTdpH08i/tkcp5hrzmwi2w==
X-Received: by 2002:a05:6000:46c8:b0:45e:dd32:92fa with SMTP id ffacd0b85a97d-46a7efb7522mr27270418f8f.12.1782723368384;
        Mon, 29 Jun 2026 01:56:08 -0700 (PDT)
X-Received: by 2002:a05:6000:46c8:b0:45e:dd32:92fa with SMTP id ffacd0b85a97d-46a7efb7522mr27270397f8f.12.1782723367842;
        Mon, 29 Jun 2026 01:56:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm17377098f8f.13.2026.06.29.01.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:56:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 1/3] drm/ssd130x: fix column and row end address in
 partial updates for ssd132x
In-Reply-To: <20260629084317.10265-1-amit.barzilai22@gmail.com>
References: <20260629084317.10265-1-amit.barzilai22@gmail.com>
Date: Mon, 29 Jun 2026 10:56:06 +0200
Message-ID: <87mrwdd8t5.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0PI846Rvi37ClhX7iDYpsrk8Rmd2ILOADKcuatmlAqo_1782723368
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

Hello Amit,

Thank for your patches.

> On Mon, Jun 22, 2026 at 12:36:30PM +0000, sashiko-bot@kernel.org wrote:
>> Pre-existing issues:
>> - [High] Potential 1-byte out-of-bounds read past the heap buffer in
>>   `ssd132x_update_rect` when device width is configured to an odd value.
>
> As stated in the review, this is a pre-existing issue and is not touched by
> this series, which only corrects the SET_COL_RANGE/SET_ROW_RANGE end
> addresses sent to the controller.
>
> Gentle ping on the series -- it's been about a week with no comments. Is
> there anything you'd like changed for it to be picked up? Happy to spin a
> v2 if needed.
>

Sorry, I was on PTO and couldn't take a look to your series. I plan to do
it this week.

One question, though. How did you find these issues and came up with the
fixes ?

It was just reading the code and the datasheets or were the issues (and
fixes?) identified by an LLM? If the latter, then you need to add an
Assisted-by tag to your pa+tches.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

