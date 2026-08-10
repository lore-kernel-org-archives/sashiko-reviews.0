Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C24840A952
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372108; cv=none; b=sc9KpHGiucm9jBi9USlakqlm9WkxilqEoTdz1aF19yFNiqSBNqMMNfuslDgNTr6YhG4tDlSFU3QV5MMrkEud9WF9wIvFjWcV+bvxoi1Ij5XL4UirWaUZY81CgTJDa4UAskUMRSIzKKyt5tJlyg2iqhHwHDerQJ3fhhIoKq/1SJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372108; c=relaxed/simple;
	bh=lShNwzDajuraG+khY2GVtiROBl6Iq+vHJAbI4C5dB/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqdkjZkJF9nGhtTduQuwWVOdWic4MvUzTUzlHfesvW+EXfSO8Or493130E7Km3y35OhpSTAW+2C0P5pH8FLH6p9kkz7ubFubWBO1Lk/zKZVAcwjAZpJXufSG17pOSYMT+fKRHiy5fwQybCy2Ay9+F0NOSiW1QBzX3DwnfCrQbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fmc6Mgic; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fmc6Mgic"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso31997385ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 07:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372103; x=1786976903; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YPUW5eq17gaHdscg2/3j8ixRAadt7Xlo8DfyOTiW6hc=;
        b=Fmc6MgicwDlyJyDhB8OFPELsl2k3+C6OsXGg9fkzwN9t9ZD9LyX+RdY06hDzkbbfJt
         dVXuK0i0efVPkGImrsMrt69xpLa5+0VSKnaGaB9mjcV/9bEguVMhD8Ayo2jyT1gqGzCz
         RscIxPYG+8Nqsf5WUPVpWqrcQz+9r+SM7IcoUTS7O47nLdz4IjL0X3fySppuyLP5/OdR
         sqtXYFbo9LoUvEbd812IsYEO8keZk0HKGzpIxDnA0jWyv9GqtBoA/QAa9jXDAoiv/jrG
         ijRMHPV8tkdby03CRuq6j7lzLcwfK0Rng2ZMW7jieKbU7lmqvTVRUCIENDNU5v5HYz1T
         GsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372103; x=1786976903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPUW5eq17gaHdscg2/3j8ixRAadt7Xlo8DfyOTiW6hc=;
        b=TUEsN/FPMT2N4i2LJjJiE3RCvxdfbEU22xRN+ZnIFK0oRdqAwvIy38H8jnz6jk0rYn
         +H6RTDkjofQEMXTdMcoCOW24swhTUw0A7i2zOkDzJTPpmWn6TT664/zY+QosNgiFlyiR
         Kjv+MzaU0IwiFGDqC2LkXJ9my/8x/H+bQM0YAm7sSaae7aVekESp65DbN9gYzY2UmlEp
         VgnTBZhEAUKt2MDKGWNN4yShM0DkBOySYPS/w+VzITajSTndpXKTwTQ2Kwjg1N+A8zIs
         OVHNlYwP5jahmnAPYd+HBe+le6KKc8Ncts6Pya2s+hH029vUADtFq+qCJr8fuX4YLbcN
         AqdQ==
X-Gm-Message-State: AOJu0YwmYcKuHRaDhCRDI5QG5pbNXURDwn2XRhWlt4xPt5Si1VYsEKWE
	wTXvw824Ss8AnJILfL+JZfqMyTikPdimmI8+KC1F2uVbMzDk1MtK8ZAKZQ5gVw==
X-Gm-Gg: AR+sD12EfYxc8L2gkoC+2Prkbf2+iUF7bxPnT7mLf73lVX8vqyHKtj9Wmfyi/64dfH3
	6yhRFG6S46A/TdHr/R67qQHS5WepEmOI9lFuDiTUiyvdDzDU5WI6GUvKUu7R0VRPduRivyMd+Aa
	uNbLqkSOtsPuQ7/qwpMgtRSeUz7y/lLKEEPGkkNGA5w6TyGJizBZf3DSt4Gqv/rmUTyvPqj4LRO
	M59xdVg3BnVTAEBMdeMn4f6PbKk1oIZDfMbkz0I2TfNYKrbA0v1n2cuB6Na8Dmk7uPqnrDsOsnh
	H8lgc3T5uQgObkjfR6sdsua/f6YdcbXhF/9IuuwAz/yljIl+8odhA1re1GMKGwp0tk97ERheDaP
	vxGfgmRHVWhE27RCoU9GsvQ93WZDasZvrTNq3Asf/STEOm+XdH0g3It18FF26uRaPbpJiqCshhx
	FJPOpG7TnzDnnF9Wj6GM2BmXStigUKij0n2gjgvyEeJziLETFoz4MgTtV4PLWEyRqu/JTzUQdkT
	H4A0LCnYANd
X-Received: by 2002:a17:903:166e:b0:2d1:1d3d:97b2 with SMTP id d9443c01a7336-2d300342870mr20218535ad.11.1786372103302;
        Mon, 10 Aug 2026 07:28:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88473sm40465421eec.17.2026.08.10.07.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:28:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 10 Aug 2026 07:28:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: sashiko-reviews@lists.linux.dev
Cc: phucduc.bui@gmail.com, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: orion_wdt: Propagate errors from optional
 IRQ lookup
Message-ID: <d20da173-3afc-4ebe-a89f-fac6f89c8b73@roeck-us.net>
References: <20260810082606.42623-1-phucduc.bui@gmail.com>
 <20260810083632.3B29D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810083632.3B29D1F000E9@smtp.kernel.org>

On Mon, Aug 10, 2026 at 08:36:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Probe deferral of optional IRQs causes a running watchdog to reset the system.
> - [High] Race condition in driver removal and error paths allows IRQ handler to access unclocked registers.

The first problem can't be addressed without somehow selectively
postponing IRQ handler registration, or in other words re-implementing
probe deferral handling in the driver. We are not going to do that.

Fixing the second problem will require using devm_clk_get_enabled()
and is out of scope for this patch.

Guenter
