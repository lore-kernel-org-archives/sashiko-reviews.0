Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215EE403B1B
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760794; cv=none; b=vA+LX6UR8Bse+CYhIYNSe77szFO7OpsyrKuB6LEf/KakUkMjJtOMU5JRXjPg86mMo6oXtTqWbW2I+43imXMhyPCGOu7580Cuzy2bm8dCL2bSAULkzhRTFHElC+fL31c08xMOpYHm3frX9VZK41C7NX2xTyhPv98b/kkZCpQBKQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760794; c=relaxed/simple;
	bh=J9wpk6NpmOuni2B95yTAnUwAvN0XKY4tvdtiA24jRbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWc3xBqjXi3jf+BwJ0zII0beO+9p4QgQMD2qJ3k3tuiA74h7TB+iq+l8TQu5//A9RSvyr9o+QmNEDhtU4GC70ES+GIUoHcs7B+UdV9WkF4qH60QDBaK240bzbgv9koRjmgrV8b5DZJZYa7HJyBJmvoLsP+DBNWcdTjZer5uzHbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXFCBzVu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXFCBzVu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso13487245e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785760791; x=1786365591; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1m8h5r/+tF9JaGxNMMyaW+Gg+qBfAIZ8VU2Ehc+WwM=;
        b=dXFCBzVuRz9HRUKLr9f4MP/7dEJiF04X6XEvfwgXt+ZiP4f4QV4/leUIS1n8O/Qq67
         g4wUK9ZrwAxKPmyPJK34o4Iziqi9C5R9lJpzSdBKWK5EA5aDbCZb9O3emRmOorOXnnSl
         iw75poUrA4UtZUL4RNMGfaJqRY28CI8NTatZbCBhcnF6FgA67Yj1Jmlr+G2ZE8qRyk1I
         MheM1vholEhdd7jQ2rfHST/mcsR7KsJa5DIwKzbSaC9RmCGyT5a4rY+amw9UTZteRgEA
         0i+KjdG0MpAMwsOMkcXnJwMRMq9ZHI8LM+4tm/rh/SHhKJQWANQ3kS54GDk7DLTBUSrl
         zKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760791; x=1786365591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t1m8h5r/+tF9JaGxNMMyaW+Gg+qBfAIZ8VU2Ehc+WwM=;
        b=acs2e3CHA747fYLPzvuLP0H9KCKcY8SiFNHw8HRxqYOTszyV9rKAV1R/uiOe2f0bdu
         bWQQyY2BAGl0/BZXk2nkF0l9RIVxfhS+yy7taA5fQAo9+cHEj7Gqe17SvCuNVF9MLhW2
         xhFM+QrT07F7aQMHMrpIze73t9V/AYluWMc25dhx468tUbAvhsbsI8gP7H6rQdSjTO4v
         j6FgnFDcRaQ54E+fpy81yUGlDsQ3UG8F71oW4Wo7+WHS2YtJzdy9hSlP4fkqxfxz4qZS
         +6aP+1Df2+3zJL67krMfxNU3Hw7g794MTElD51ESQO5qAaAVOWF1juVF51hs2WyeGpPk
         /IQA==
X-Gm-Message-State: AOJu0YwLgc+aIGQQQIeaqwIn/VN0jRFNSGU3lOmPiQWZyASbWYdCkPd1
	I2w+KRRBnns9vAVDvrULU4PSD2cb2eoBVwautCWOVMn9KpPDzUPkJ9UVgnI1vErq
X-Gm-Gg: AR+sD11TVfybdDT6XX5ciGKJDOkYH+Z5t+DnRgSTDYhPdcNowGV0pTEZelmwR5/Aja+
	jY8b1KjU1MF9u0zV7B9BRdSwOck1syzzFZk+UzDTyqsmTI0JaTrvRdimcD2g8iOi9lX3DoHN/W7
	vtmVpSE78q7CI/eE+r7AgAFBVH/nP3b3oiPEQQ7HtRNTBcFtQg74jCjPfL2GxHXIo7WAk9bX+qP
	7LYKgdLxbpdBgP/2d4j5AjljulFsaTmYD1INoPDp1Yjx0bL+1MLl1O+lLMrcEO4IpYPx41Mng5d
	k9xmIIVKjrKEThL1M4KkdWoowoYzU+37WZmuyfzKJVQxmNNRt2+t3KoffViaV4oZE7y9MmSGNAj
	6jzdpco7/cebKjCZUX5UXtHucazfR2Cqw1foqmkVI2Gq5bXP1I/RcxNEPlbvClfnMx/wc7h9yfF
	K2uecAHOPBdY8hXHlLZE8pyq5IoLK8ngUO05TWN+koQbq8bBajoDJj
X-Received: by 2002:a05:600c:840f:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-4980c5fa29amr195199175e9.0.1785760791007;
        Mon, 03 Aug 2026 05:39:51 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm229214505e9.12.2026.08.03.05.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:39:50 -0700 (PDT)
Date: Mon, 3 Aug 2026 13:41:00 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, dmaengine@vger.kernel.org, 
	Frank.Li@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH 5/9] dmaengine: stm32-dma3: Use bus width capability
 helpers
Message-ID: <anCMRfZDO7y5gmtU@nsa>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-5-3732f1f9d9ca@analog.com>
 <20260730143528.B7ABC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730143528.B7ABC1F00A3D@smtp.kernel.org>

On Thu, Jul 30, 2026 at 02:35:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Direct return on error from `dma_set_src_bus_widths()` or `dma_set_dst_bus_widths()` bypasses clock cleanup, causing a resource leak.
> --

Yeps! This needs fixing in v2.

- Nuno Sá

> 
> --- Patch [5]: [PATCH 5/9] dmaengine: stm32-dma3: Use bus width capability helpers ---
> Please note that the format of this report has been altered due to recitation
> restrictions. The original patch code is not quoted directly, and findings are
> summarized in a free-form text format.
> 
> commit 843bd75e7b8b643c8fda123b493184a039d48a35
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> dmaengine: stm32-dma3: Use bus width capability helpers
> 
> This commit advertises the controller-wide bus width capabilities through the
> new dma_set_src_bus_widths() and dma_set_dst_bus_widths() helpers. It also
> updates the per-channel capability callback to clear unsupported widths
> through the dma_slave_caps helpers.
> 
> [Severity: Medium]
> In the stm32_dma3_probe() function, the patch adds calls to
> dma_set_src_bus_widths() and dma_set_dst_bus_widths(). If either of these
> helper functions returns an error, the code now does a direct return with the
> error code.
> 
> Does this direct return bypass the clock cleanup? 
> 
> Earlier in the probe function, the clock is prepared and enabled via
> clk_prepare_enable(ddata->clk). If an error occurs later, the normal error
> handling path is to goto err_clk_disable to ensure the clock is properly
> disabled. Returning directly here leaves the hardware clock prepared and
> enabled, causing a resource leak.
> 
> Should these return statements be changed to goto err_clk_disable instead?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=5
