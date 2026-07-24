Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AC525D530
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886178; cv=none; b=GYZK5FtO5FyrWd1sjx0B4YYMP80IW6juIJoa9g//9hLoZdHDsW4BIKJetRXnJda+zyZYohOY3dpAJwfrHXsgL9RyzgX1t8aCGaNMB9156FnEHwfesd8Yfp3gCf7xXV6DUaVGSz8RqvoLRoT6/U8stWvRwsNRDFg1fEO60gsB8/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886178; c=relaxed/simple;
	bh=We8qFSOI7jlWJinOMXuBLI+bmBYCl+vuW6Q1KE3NPvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnFtmcLE44eKBp8QG0n6A2mqi/huHB/BnT00Pzkc3HQC6YlxYbdlKruHDD2HK5e7o0tOerrKOzDoz9a8Jf8EeshvgPzfWeQqPrOHvQz1kOnnEw9Huf/IP6Yel+1UXIZ8a5vNx7SBZNndN4m5E7omqD3cQPOLssONVpgaqsYDezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f7VUaH/L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f7VUaH/L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495635a85d2so2340325e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784886176; x=1785490976; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=We8qFSOI7jlWJinOMXuBLI+bmBYCl+vuW6Q1KE3NPvM=;
        b=f7VUaH/L/4gHNEs1lAcE49k5oCwYz1gwoh7I+gE7C+CL9qaHwqaL6UfL9L95Wq3EpT
         0qRnYaBcxojVRl/GRTZEGt4rmANsVMhacyrh3/QUiCs/I4oiFg6NEKywFPgLfQ0smtZJ
         yQn04aWuno97+ZL5odcUeEuFbg5YNVsHnNzQXyj7xqDy3Tb1NRVmSDVcAVrO0MdL8/6b
         mWIkU6HX3OedKZU1UgPQDftNq9skBUjrhSBeAudYHGopn+6e1X7kQb8MJsxL0gQ3PTJr
         bGsMTvbLKs7o+DGF2PeGbqf0vTTEwV5R4eeulhigdyFXRzUvX85lBBY+vbMemnxWQC8b
         yinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784886176; x=1785490976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=We8qFSOI7jlWJinOMXuBLI+bmBYCl+vuW6Q1KE3NPvM=;
        b=M7HNRXXqLYWfFHY+S2UJEVB8XEFxXalB/PErlOM4ItX9cKNFmNs4cApInXJp2Rzl0Z
         dVOJUAn0pGu2Cy9Ow40VKASwpEx49XmrIugV8wBjjVBG4f8CyBTH5xDNksF9rn5EWMge
         sP/Vdqc1T6yvqbXpzBQP0c1JZwi/FXGy/LTqbFG3mRU0BKQmIrMlZtIvWvSuFHtYMZ8r
         wMte0p5ez3WPjnBU/bHSZ2y1UuV0YERjm2WiRIZG1Jd1Nn/vqbHhBqXUlF9+PNXfweY3
         xQFJC9sCG5m56LoNk1y4aOEbzucPp3fnad+vAnWXEvWXrnG8zh7hjDcoEDQdvdRR6LDI
         92Lg==
X-Gm-Message-State: AOJu0YyG4YDCt0bunZU8mCr4EOtHwPoKGPUeO9EIKxlIg1coc0bXC1nH
	R9RokjkXs6VO6rT5W/wZB86q5M7m/GoPSaLSPodVPHq3SFUjtvx76Ej1CrzUJBcjFuU92NwMmti
	OXSd2oIbWcg==
X-Gm-Gg: AR+sD105lld69vNxumUfXPeDqII1K87ywYyBaliUFc6N2hX6wyjYpxL5ZhxY1fQ8xZM
	G6o6SKXGEeReAcTo+jTHI8KOsL3Le8sGv8nVpNaDX3a4BhvUOeO2tcwz3VBHq37Mj5DI/ysfesr
	E5R3AQjDG7uYLUYUKH3EXJOEnGV9zLvEMJpqscgdb7Ldk6mMb2llyL8DXPVplFldBr+yzoe167/
	g/I0o6dTab6Ln/YzyxHvnSAskZ8wzw70XXMf2/y41JZG7Z3ZqpVKNlvcbw7kBLXvNydjB1E/3R2
	2FTw3B10x7j1YrucTQ4lKJkJSMkK6rU6Vzp1uKMSjPn9IkMuf9MU5pni5MGG7QH5mBa1x9dk0e6
	27YGWeU3mpKgkRMgIRgJgNv6XmQ5F5qQF0ZwYfFgOMZT4vOmeZlXPS7vjEAFTlcp7+k7VTYR9W5
	xipVej3g==
X-Received: by 2002:a05:600c:35cb:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-49573cc1305mr91693415e9.1.1784886175721;
        Fri, 24 Jul 2026 02:42:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af78639sm57198265e9.7.2026.07.24.02.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:42:55 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:42:53 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Tao Cui <cui.tao@linux.dev>, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH] selftests/cgroup: add PSI pressure trigger and
 validation tests
Message-ID: <amMxeLEcCkRiPuSC@localhost.localdomain>
References: <20260724025826.504586-1-cui.tao@linux.dev>
 <20260724031014.BA51F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upewxrcqpojb27ub"
Content-Disposition: inline
In-Reply-To: <20260724031014.BA51F1F000E9@smtp.kernel.org>


--upewxrcqpojb27ub
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] selftests/cgroup: add PSI pressure trigger and
 validation tests
MIME-Version: 1.0

On Fri, Jul 24, 2026 at 03:10:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Medium] The test runner moves itself into the constrained cgroup before forking, risking being OOM killed or stalled.
> - [Medium] Test hangs or experiences severe delays due to unconstrained swap usage and synchronous waitpid() without timeout.

Valid points, cf what test_memcontrol.c does with cg_run() (and swap
limits).

> - [Medium] Uninitialized stack buffer `buf` is printed to stdout when `cg_read()` fails.

Here it seems to have swapped the logic and the code is correct.

> - [Low] Missing `.gitignore` entry for the newly added `test_psi` binary.

Valid point.

Michal

--upewxrcqpojb27ub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCamMzmRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjgkQEA3ClURFsRSyzfyrf0FG0y
JP/t4AkbKFCA2TQ0qQZVMFUBAJbnScXdFMI5JS6y5qOnndFsZ0W+Q8GSV5C8E7LV
ukQH
=Ottm
-----END PGP SIGNATURE-----

--upewxrcqpojb27ub--
