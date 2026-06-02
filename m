Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37E3932F0
	for <sashiko-reviews@lists.linux.dev>; Tue,  2 Jun 2026 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411604; cv=none; b=Dpa7bwku0XDk46UVZQVyZPfYsNsvFlhz6eXvr/fyNDjpcH7mrBB7OsPPM43CR7OnkMpmfGp9qKLp+mqXimfehTe8EoJ0HG1f6W4bINN7nfBDULvk6XzGdzpEIZ0Tg52WcfCEEnvmVCI0p+w47owj09DluJT4b66m9C3EnNV1jJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411604; c=relaxed/simple;
	bh=kKsyUzj869JrUGC6zdwIqfY+nNrtAeCgbmcr9S0WYKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ake5v55itf2qlnaFGVXCyotjj/00B/xGtC6bVp5ovl4j9QEVmrlL0rFG/nf6+gk8OkGdsvuMM8m0wKkZr6SyKFYuHKXj/N0Ayd52OcqueH79uq4t89+Y0nBDXEeZs63ENAnFSuC6XmkOFkOIvqgFq6EhTNzvzwT8O1gBGeM9B3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYj6BUkO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYj6BUkO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490a7678b2dso23358535e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 02 Jun 2026 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780411601; x=1781016401; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zuifNF0SxFncxgo58XRKOiC8D290RPKvYCe5WMAJN5c=;
        b=XYj6BUkOqGx/DNzGBAqTG8IUNvYceanSlN3mzjgPyeIx+BNx1AncR3QMBFVHqCaB3U
         bmoEWVUsYzufYREQbnkRtqmmemzeJvT9jjKP2MNkZ4pL2D0qsxAoix1jOfkpufhw5EW9
         dJBZH3OJSL1I78fECxHBg8D9NjBsna35P+C4vp9O7zSjXr+jN/c5zBuUkBXizjwcPSwE
         /Dfcd2/7tjEWG3mGVeD1IhDj7bOdlAMUH+Ax6VnIJM0n21IY+Auf5jSc0ErHoIKBldc5
         eDbYzqHWzjO0QC0Gu/Ed7HYJ7trPULOSi29AnkjUh4qqf22sw5IF9la4A2lT+1tA4h6U
         U0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780411601; x=1781016401;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuifNF0SxFncxgo58XRKOiC8D290RPKvYCe5WMAJN5c=;
        b=sKtAaPr2qVjDZmLVSlOgFGOk7nXl9PiALnfR/UQARf25LHqh2L5Iwoqf/E+QKv9CVG
         VSV5siwlolemibW2yhPlGCc9XyubCAgv+ogkDBz0JwlWibH9QzoRfhYXHkTfRNbo5vzH
         MDin6fG23XTteKlbULZWe0sLmmVTis7F2lzF/T0sScaY+mx082fMY2lSdiLmb5WvXpiw
         l23Cnvwo+XeNJ6Y1mGFswXUi26Y5Gn7wVtB1qVQE+a+amfyTNcYf3iZa1NFX8kXp/KLS
         bjUJb3bHW9M4DUGDyiNsa6XZ1gl+CFvYe8S0mcycTBXmxnNExj7RfzuvWyviTNEv/mVV
         MKIA==
X-Gm-Message-State: AOJu0YypJd28yxWvunlrbueFmtn3GewkbUlxTvcq3Vt0p5lU3ims9ylG
	2rXv1GBb53ALhVfwtPSrsGG1vmeXnMwGZVwbpC32ixo/IuHY8R4JI+2AKkS+vb7o1kO9C8v/Vgv
	ta40GRX0=
X-Gm-Gg: Acq92OGKF02OD34cRA4kh6X2Ry3bd8iI1qXzYsGonXdpnRspDHpKOF9aj1Y6pW39GYu
	qUAa33S/ooKAjlzUyqkn3dd/M/9pHVktN1bp/AJINQ0/bp6nk1UUKgDrr1gwNHMsPV3VkjPAGhZ
	NZERFJ6uCcvHigouSPYCqUZ4fzG+Eu/LXlhloUEoj7PwrLKcgTttbNk9Hkd+qSHv9ZSJANVv3gy
	tR8T67swESpgO3fBLFKJHNUVDwUEnyDytEqhGGwbG+WnIFpKZhSXUORMBxzTSV+G8sG1WsYPqxl
	gxNv91n7mtHbGMl8EKi6wX5mND5ZGKO5YjP516iZdYnJD9nu33HjZYrlj85PU1N0zFSi7UN0daO
	SLkCw6+FgYbxduswK3e/c7GPlGVPg58xTGL+PSQC87mY2AXX7PBDym+VadSQ0En/MF51L3eQO1E
	HXvtQpvE7TKJAevAa+Ws658PXjmw+WEthGBpUGFvrhwd7OYQ==
X-Received: by 2002:a05:600c:4e52:b0:490:6237:521d with SMTP id 5b1f17b1804b1-490b5080198mr835365e9.13.1780411601411;
        Tue, 02 Jun 2026 07:46:41 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm73707925e9.11.2026.06.02.07.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 07:46:40 -0700 (PDT)
Message-ID: <e2943036-1347-43db-831b-672b87b538fc@linaro.org>
Date: Tue, 2 Jun 2026 15:46:40 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Enumerate cap->bus_info to differentiate
 between encoder and decoder
To: sashiko-reviews@lists.linux.dev
Cc: linux-media@vger.kernel.org
References: <20260602-iris-simple-name-fix-ci-check-v1-1-5ec9d0d00983@linaro.org>
 <20260602141154.4C8EA1F00893@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260602141154.4C8EA1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2026 15:11, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This is a pre-existing issue, but this code brings attention to a race
> condition in the device initialization where video_drvdata() can return a
> null pointer.
> 
> In iris_register_video_device(), video_register_device() is called before
> video_set_drvdata():
> 
> drivers/media/platform/qcom/iris/iris_probe.c:iris_register_video_device() {
> 	...
> 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> 	if (ret)
> 		goto err_vdev_release;
> 
> 	video_set_drvdata(vdev, core);
> 	...
> }
> 
> Calling video_register_device() immediately makes the v4l2 device node
> accessible to userspace.
> 
> If a userspace process races to open the device node before
> video_set_drvdata() executes, iris_open() will be invoked and
> video_drvdata(filp) will return a null pointer.
> 
> This null pointer is then dereferenced in
> pm_runtime_resume_and_get(core->dev), resulting in a kernel panic.
> 
> Should the driver data be set before registering the video device to prevent
> userspace from triggering this?

This is actually a nice catch.

This fix is fine irrespective of any other code, getting the neural 
networks to flag existing stuff is useful, so long as the reviewer 
doesn't just look at red dots in the Sashiko board.

I'll be sure to flag that fact to myself and thx Sashiko follow up on 
this bug you've (its?) found.

---
bod
