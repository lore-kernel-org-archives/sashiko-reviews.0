Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795768565;
	b=dxm+Z259xGJjc1dV9S5GOoZDITd59py25nbTQljYsrGRTPyRD6j1mLDdjUdoCmoLJbIu
	 9XUhkaEuqd4SmrELmFSRtfPk6BV52SQskHwQPGsGzeWNqxrrHyUYyoBmr6zjHJoEku0Pp
	 l+EiVoOpgLN8O6eYTMx0UGwUnDN5kJb0Y8OAmO1lPUwuE8msvyVh8Jlgcd9EK2nPj0OFS
	 qwDt/IW4jD639yP8aPWk0pUggllxUwXbIiyCpxkhn6uax/ecDOkbAUQhiaYeJ6BCiwSAC
	 XqKSYPTQQUF1q4MTPKWaPX3g3MvmXfbb6If2PS93uUzS3FzVWW3eoWVjvKDHKhPkaRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
	b=0sVbLmv5vHWJhKJNtg6fK7QDWbVPz7lUar+Y8jSVBRrJ/b5mYApudNjwxG70VRrgODDu
	 92fNHnoTuwcNALuAcmBCobykUI6C8TE86rpu008O4juSeIyCVUvgK3b8a82QzMZ3/Az5m
	 LoRMVjlR4ZjypUR2/P3LSl7UsyJCfpvLW0Y41sS8JlFLuczp4vHoaxJMQ7bmz5KWmeprl
	 LoGQklIy4ggy3oMU44+LBowD6qLcHWZOTgRh5sxlsQI2dYTkrzcoQyWk9LTIMVikidw5l
	 ec5jvW1F6xqz4KdKZfEEDC+haBdYrDPsUDYS7h5CgIyxz2Ff98DzjqCDR6+ZPRe6l6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvKR5hLM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4207B606A332
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 08:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4207B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvKR5hLM
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b88aab58fdso862461a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 00:36:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795768563; cv=none;
        d=google.com; s=arc-20260327;
        b=hQybFH/THktwDbz+e6FdmGjwNvJ1QFvGxw4hyh1df294R0d3Apgy9xkZfBx2CzxYL8
         rQ6/XLvHlV3IIaMns3+eIfMoK/g3Bj9V6HnoW4Wg36Md7Y0HX/aSF05SQ6nnkh6zEmY4
         Tsvw3rFpZ2jhZG+2/i9lx2+4Fusxk9p80qDtTKRX2iYXjvuK8aJ8dCfMkVqk1q9HB2wL
         Lwf4vLyRLuupVU9pcj8ywQH/od4SyBFVcmipXmBOrBI2PnKj6hYXunc5vDZEuydWEHNm
         DoEV1FS6Q29Bo13C+sNj4tturP+UWqe9NQAyg2rZNIkWnIfvTuDW/wUS8YZGo4rj2ONH
         c8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
        fh=JqFMAEs2tdcP9FnU0Fo1YfGBktg5tpfx+cmVBNV6aoY=;
        b=PFtCtabQUK2rnIscCdKKWEW3xcCKv5wWfxZLvuH4b7F0glcMwQDy0HtW+sKbFdmZnU
         xmgGl3o+I7yj/q0QWDqS5HAJhJu5PteRwRr+Agi69KqzeolbfrMOW9GVobNp3yxcPlF4
         f6SwbDvL3II8H98iDkVulFJcg1PuO4R72aD4p//wyco8KKzAH4l17/zpMocqv6vhsOJN
         uS5zYwaS1MWCkUTLnXuPxZKj5ndYYgD7UlGtrwiIH/jKLzRFdr+W7aSi1jpfuwLFx1c8
         L6P+O5BSDnc65/GOuD+KBHqXnYByvjANcoWNPptrN05sL4+f4Syberv9j+4l2ciFZRRn
         krag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768563; x=1796373363; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
        b=YvKR5hLMGRTNLVy8iqLO+NC7XDz85VrPs3TEpfYIeiTwksBNwcM6hiUQzQ7U6kRbR+
         eigact/8iTRwde3JVDaWa/zWBmI8aCKmPpydLI/719Aoyz4V7s7i/LMGrlXb8s875C+h
         crn91HW6zMin0nLGyWCJhgOdFpE8rwzpK3MO0SIsbaSVExZVz+PzDbI7GAgQoOjFgMN9
         V3VgMa/3r+JQ3j7Ua/4o5ySUB/9pzlTuXdLT98BihCmbkOt9427bogOD0MppbWl3PnzO
         CP2dDa9PeSJ5MrQojawgfyf0ifuH/Ktq/o60TCDVZA9Z/5OGWMwvYP9/wnLFbZMIFpjU
         PKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768563; x=1796373363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ej0zu0sGtkHApVwWa1kXVFV7LIDw/KTsfibG0hxrVG4=;
        b=iYFkrrnegCQ5VWKphaxVdQOYyvJs7Y9c/FVk1Fr5cdt11+oJWFrnlP1XWnx9qdoVA2
         ATl64Fo0KD5yI9klQE+TCGKdwPnthlxvSgbSBQxtpVC0D6a0/dpRsBnaqw4BFX2ykSqY
         P77P0c4fSSixMdbC47jIYWIL3Skk1YnXu++qeDr4ifDr2mAZ4mNt+JkfkA1wkqL9O31o
         UhnRnPurV/8kVoZD5lmlfePxcHMIRnkfpWgDYfhRvSDQ8yvYGsOjmczQoXzHXbl+3Bpe
         8DBhB0V0gu5craiTCHtJ4ETAR/eRbcDOl640ertH1wiUzFj589DDUBPUuxlCWaovG8fS
         drjg==
X-Gm-Message-State: APuU4Z/t9mLydDI2VG2sUs2BUWBe5PCxZw4W+FGS6GMGqMkGWQIGfKCF
	jEoQq4Tjv3zpK/N8dM7jSGYkfGeS58NVc2+fLGWXbAJMvtUMrTI4aJEPlTLh36w8tRcQBFsTbrV
	xeZ7avW6MLujysJRy1AjVYScwJtnC6rO0+xad1I4=
X-Gm-Gg: AZFdTZexJgwTEFe4XgISwpekh1p2ZkkTv+crvFr4wQvKr2vOYK8Xm97N8BG4c9FG9Yn
	EcRajlgkd0pp5xBciXOaaAnQ557PdpR9mklgNqmEJafZThMBF0QdU1mWgVZ1Co+iUFYdBB15YG9
	4pZ77GzSMQ3sbwejnRJ08hGp5ilrZT2AtZR39VmVC97+cF4s3U5dMT9ddnf/fRUMiUMFMxXTDdc
	B5hxGWtwJAWgSaEkhuxqcwGj2+B3ntwF/m/K5kcCX5mz2NENTtNle0BRysUfuSQOJRvzG5+njx8
	bBUjtBpik85UuXI11gRxfMwegfgE5n1uw0huwnzEccVLfgQTiGJKl0QEZvqeWWQOCtAFt2Q4pC7
	3fLqUqWgpPftWf+aYWQFxoNFCLdd3+cxMkz8wrNZTbH6alVrLaoCQRT8gLiPuMRPAKbnuRkU=
X-Received: by 2002:aa7:d349:0:b0:6b4:602d:f1f2 with SMTP id
 4fb4d7f45d1cf-6ba37d52e9cmr15809735a12.3.1795768562917; Fri, 27 Nov 2026
 00:36:02 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
 <20261127-dcphy-rx-v1-v8-5-9ddfef99221d@gmail.com> <sashiko-outbox-236847@kernel.org>
In-Reply-To: <sashiko-outbox-236847@kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 16:35:50 +0800
X-Gm-Features: Aa3M54ovM32g7V-SSPNRX95l4DBsAa-yp18pNqVZFJQDxNZ-uXS7aZWkl2Kvurk
Message-ID: <CAPwA33J87MAF7hLvBE3_03_jQU=CrKB1ppc6QqLkksuQTB2Q7A@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] phy: rockchip-samsung-dcphy: Move block-level
 setup to runtime resume
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Can removing the APB reset from samsung_mipi_dcphy_power_on() leave
> spread-spectrum clocking (SSCG_EN in PLL_CON4) enabled when the D-PHY
> transmitter is reconfigured from a rate above 2.5 Gbps down to 2.5 Gbps or
> below while the device stays runtime-active?

It stays enabled with or without the APB reset: pll_calc_rate() has
never cleared pll.ssc_en, so pll_configure() sets SSCG_EN again after the
reset.

Unlike 3/9 and 4/9, which fix problems that moving the reset would
otherwise introduce, this one exists without this series, so I leave it
out of this series. It can be fixed separately.

I also cannot test it here, as my panels stay below 2.5 Gbps per lane.

Best regards,
Jason
