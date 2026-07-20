Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC653612F4
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 18:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571082; cv=none; b=hS6K1bORtTyGiR8xXEu5cWCEpWNTYep5R6EyeAvz08V72XjUMozq3I0uSQM3btKyRqRPgt8zq8Y8im8DSgUI8gcRShIKDS8uomDJ21FC5VV5BXWF5M4nxT83KssZaVDSqEglN2k8rKi7sYhuLgIOA0bRhbR3vAktEp8pwi10zWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571082; c=relaxed/simple;
	bh=uRW2VCAeEQivysKbAUs/GHTCeHX+/o3EZ2/q9a1Csp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+/ZfgkRGkmX0Sn7KfsVlFCjBw/mpIs/tTr3RKEhgi6tIFa77gSuGtp7PJ1g9UsgCTl8fPVFzSodm6PGgPJguhhzb6c0ghxLIA9xfUsmh4x5fnJkvgZcQm+yyqChYtbn14PM2VxFXxQoEO2KqJNps+BD7vW+wqS+e5M4x/UgzH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=No9gLT2j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="No9gLT2j"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cab97c86bdso423795ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784571080; x=1785175880; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hPymPRaw1274m7xN6MjIxFPUWx7r7j9/WwTuQBapZM=;
        b=No9gLT2jCL/H83mfepe/NIljItGrMHn+4himwQPeiUp9QXFX9Pi+XNdy110FzYM3ag
         +3BbzYPDsyNvrLl/m1EhtPpYgZ1YZnMhP8cjpjPLknHJTvyBZDWtOv0YaDA2CTX64gKQ
         +Ga2cK3pIQ4WexIdsraBXyAW0KUhmzd9v0kH9CX2CVOjRsdXsMPNW/AKWJe6KROZ9pXX
         yUj1TS3I2vEMn0JtgMvWrdC91IFMv40losXI1skQtte3Qh3G7AWSNXp+nLxuC246zoU7
         i49afwmR/DxbFnHaG9m3VUQ1tQeG419x3Zts4wyzO6MTdgyxgamr2/hDf3vic0E0VOHq
         caqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571080; x=1785175880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hPymPRaw1274m7xN6MjIxFPUWx7r7j9/WwTuQBapZM=;
        b=slUAMrkfLfEYr5lGmUjrYXG653xaDkUYz12HhZ6zLGC+K/zB3EWT5nQY9qDJhXmgWV
         Je/Fwq6fjezeQ2dD0VTPTm/d3Tjt01W/9j9HdU8ENZNx6Sp+591LFXQ7MGS3FjKoUyVB
         ctHjhsA9rsmCdsZpTpj+fV6r09BXD9NfueP6lcAhJi2DsLjrpfidwVOR7IDszbU+9LfA
         2gdwuFtPRD2G8I11+LMpQ9DPvodFy5y0w2FDgY4MQ/LLZ/N7+WKHweAsNpJk6yK8bj9j
         w+YcklqYce3PMnNNAufM/MQLIfBO3gKylGR1uJ+vCWRImXfczUjERqjrIAQLiDZETISF
         xdUg==
X-Gm-Message-State: AOJu0YwmPlAIRKz9elOhjAfYKvxZx4r2s4Pmf3aETQ7VaSpGL+yTy3Dw
	CXHgK+jUA8nXXIEVCIxaAvsdbKrZLmQIw0SbePlT3gE16pFUzHbolN1tUXGsQ8eYkCc66WggQSL
	nhbukN94sivE=
X-Gm-Gg: AR+sD11aUAiud1Z0ITeHk4yqRX0ElvIq+RZVSJeWwfMJ3HSPhYVno3FgVNVWzhh62jY
	CQDOma+34WGP7F56NizkZr1NDW5VoQr+kw1ooJ8IW6vTjWMg43WgYy5Ofuns2h4/d9o5se6CKX3
	O4y5nzYaEWfApVmjn7TLVzrgmIP8oll87oRpFnNpY4DPfUk72hxOcViLiS1idIDmUb8DcoVNazi
	X5uBEM1klYgIOvm7nlnx4PX/QjawshFuMfxMxVChjMveAAAwym2AQszADSepGFZfMb+LcSCHw8b
	oVnjAmG1R/iI0LNBsoE8sQ99kXRa8aaRVDS0lfgZoHuXsth2sbotUKKlw9oQVnUX4RCG1NHqVqR
	F5YZjd+7nTtM+BX3DhhrkpbwmubyOWzqz2iLk0optaojZnf/GV2w0+2/3C6xeyxNM021UuQWf/Q
	7Wyl3XOGK1h3MVymVnymvvVaU1J2eKaYkB2uHFASEU3pDf7a4=
X-Received: by 2002:a17:903:b4f:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2cf7b6fd8admr1656055ad.25.1784571079509;
        Mon, 20 Jul 2026 11:11:19 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9208f6bdsm171534a91.5.2026.07.20.11.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:11:18 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:11:14 -0700
From: Vipin Sharma <vipinsh@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v5 13/20] vfio: selftests: Build liveupdate library in
 VFIO selftests
Message-ID: <20260720181023.GD1381701.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260714151505.3466855-14-vipinsh@google.com>
 <20260714152031.CB1DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714152031.CB1DF1F000E9@smtp.kernel.org>

On Tue, Jul 14, 2026 at 03:20:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The VFIO selftests Makefile includes a non-existent file `../liveupdate/lib/libliveupdate.mk`, which breaks the build.
> --
> 
> --- Patch [13]: [PATCH v5 13/20] vfio: selftests: Build liveupdate library in VFIO selftests ---
> commit 8a41a1e6305bdbe73648566ef65764a964e68dbb
> Author: Vipin Sharma <vipinsh@google.com>
> 
> vfio: selftests: Build liveupdate library in VFIO selftests
> 
> This commit imports and builds the liveupdate selftest library within the
> VFIO selftests to allow using liveupdate ioctls.
> 
> > diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> > --- a/tools/testing/selftests/vfio/Makefile
> > +++ b/tools/testing/selftests/vfio/Makefile
> > @@ -21,6 +21,7 @@ TEST_FILES += scripts/setup.sh
> >  
> >  include ../lib.mk
> >  include lib/libvfio.mk
> > +include ../liveupdate/lib/libliveupdate.mk
> 
> [Severity: Low]
> Does this file exist in the tree? Including this missing file causes a fatal
> build error when running make in the vfio selftests directory because
> ../liveupdate/lib/libliveupdate.mk cannot be found. Was the liveupdate
> library intended to be added in a prerequisite patch that was missed?
> 

This is series is built on in-progress PCI Live Update series.
https://lore.kernel.org/linux-pci/20260710212616.1351130-1-dmatlack@google.com/

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714151505.3466855-1-vipinsh@google.com?part=13
