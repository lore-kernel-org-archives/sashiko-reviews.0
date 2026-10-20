Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525704;
	b=HksSeWqUD1J93xxOrkzmmDTqtz+yzwJLhz5nT4veL4vga6G5YsZZqBo8mPwy9mYD07l3
	 ZRtf20IdC0T9iZaYP5p1oVggWSo2MhCe9roLeBHXSA3EbqkmUfuv0j+Ynvnfa154ZzpyJ
	 JPSEqmy265/4gsQGtQ796KlBopceEkzsBaSQvFNQHnA+TduZ9iU0DWcGCMgLizzDiEdW9
	 WIVW9yiLva2Jm8xpZgVRm8JSTtoDD9d341ASltIhh8ARuIWbcU/YiQ0L4oQI1MNb+Laoo
	 gdSullENMdEZZVoKj3/f1nOH3leLp1KVwTxbBYsirn02SZ1kY4AdCgEm1nPTALMELWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525704;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=h5roEAuVHTY/cgyIMpvAeK1//9K48fpoKjZERhs7pAQ=;
	b=Ky0GiUrd0AW8ZN0OqsJNfqOxQsnklKE1s6obPlUrG8gs90Y0vqSaLp3dcc6BuD8yFgKA
	 pu2vVCWj3XvK6yYeD5tg6oMmOaR3jyuX10aExjcpep3NzOK6gqrOAdMwDhDA42awHamrf
	 /NTV+3YwZ+TeeRPkIgQHA5jZmSa6G3c+KSvzIYsGXsHz0Whq7Uw/1HQJE8DjtAvj9gyMt
	 JQTM2lO2D54sIrcNew5dzc2jO81CQnbcVhhYiYBrfQ3+vxnjB7nrydPOhmIKifQu5BGkz
	 mZHnghjfoBYJJ88QoGZ0wQ3li9rozjkUozEEkCXqvjb1taxCLG5uzT1Nt6wRjCG/EvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=puRb4H5i;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38906606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 19:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38906606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=puRb4H5i
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 877F3FB03;
	Tue, 20 Oct 2026 21:48:13 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfXsRat3eS58; Tue, 20 Oct 2026 21:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1792525692; bh=oSfuBRS6OILPNF+ZPqvmTpgL4m5ntEHuSe0w+gMxnqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puRb4H5inBU2xrJh178T+N4tFpbClFv9K8hMzzvnRigXJK2gjkWcBjNebjILeC53y
	 sCFS5VdIpKfm6fhYISnAu/dvLs8ql4nX/IEtC15Hym4rOCA+ZkTwcOlxOCuKCwA6bx
	 3Y91oUlqdz4UqSD1Wp8gYu4aWhEJzK+aOsidxJmNay6a3pFGG13M+2qsEiuACl2BMf
	 caXUfKwy7KkGPr8KN3Vp+q2fxry0vp08Y/RitwkzirPXB0e2WzEob/pqE0hA6/KyWZ
	 UbFfLUxJKQ71M6L8V+JnWVRIHAf2qFVhq0Od3FeGA6dk+v6QVVmtmdM/DcEOLx+4hs
	 8jU4nTI8dHBIg==
Date: Tue, 20 Oct 2026 21:48:10 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: sashiko-reviews@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: allow to set package name version
Message-ID: <atfFes2OpYRhsgFN@quark2.heme.sigxcpu.org>
References: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
 <sashiko-outbox-179507@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-179507@kernel.org>

Hi,
On Tue, Oct 20, 2026 at 07:16:51PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] kbuild: deb-pkg: broken build symlink in install_kernel_headers()
> --
> 
> commit bc8efaaf9e21748a005be3c75bb9c6c2334ac049
> Author: Guido Günther <agx@sigxcpu.org>
> 
> kbuild: deb-pkg: allow to set package name version
> 
> This commit introduces KDEB_PKGNAMEVERSION in scripts/package/mkdebian to
> allow overriding the version suffix used in the generated Debian binary
> package names instead of always using KERNELRELEASE.

That's true, the script should use ${KERNELRELEASE} when referring to the
kernel version and $version elsewhere. Other parts of the script have
that correct so it's just a:

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ba1defc616524..5fdc9ea0dcca4 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -147,8 +147,8 @@ install_kernel_headers () {
 		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
 	fi
 
-	mkdir -p $pdir/lib/modules/$version/
-	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
+	mkdir -p $pdir/lib/modules/${KERNELRELEASE}/
+	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/${KERNELRELEASE}/build
 }
 
 install_libc_headers () {

I'll fold that into a v2 after waiting a bit more for other feedback.

Cheers,
 -- Guido
