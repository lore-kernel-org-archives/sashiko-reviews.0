Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161451;
	b=uK/+8fcWKMwX9DcN1JTlcdOQbjqP4LwLYH792zYApW0r0Fs5rxOSU4FCbxmyWZciIaeQ
	 NPeuXNcDDQi+tEW+Gwo16CiX/vKtYE2+s2uVQRoXWg2SoR5/Lcpnq+H3bhJFyU6tt09Vp
	 8BGCSclhPUnoD385jiEkgc0ZkWENKMhXelSR1msoYhkFyDXofGLydXwsAB6KjKEg1mZzw
	 t4WJHdrYDGCkNgSfQxZDDas/lxRnE1DxM8upQkmGBHyDu9lp1NDRGLndduOP9Bck2GSYP
	 3toO2XEXgYJ907yJgRTEP2wQEbrcoHVQU2KJqoa/6ZxcUqajdIMixni6eseghppjaag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161451;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9kpeqjW6Rq5T6EuMnyBvBxaIaXXg4raX5/17KI7MqmE=;
	b=CIkRZx4icMuiU+3v8DSwISjHEoQXqbyMnu+lvxxhDKRUbxGFtQoLWDp3ZSHftNiFub1M
	 6PmTwfICzsH6SEykTcvJXEUGKhBNHQw78I9ovHFCWJuj1q0QHIaV0oDUOj648QDBkEX2p
	 Svzhc11i80EmUGQUydZHDpuXg4UnEfqmRXx7SvnH0W4y2V0NnOLZogu4SfrPvDk5C/Zvs
	 QODgfblQ1uRlCMkO2yGbJNTQc38b6putezZM/t5HQosTYPtXOsT3zTgeYqeHiceXNKYkz
	 pc8xo4JL7WoD90O6TnO6Bx8SBZx/KJl23d0fDIAYVGkm2O0SP3ZNeLvKgIf63PfYJ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=VUrGsfpx;
	arc=none smtp.remote-ip=212.27.42.1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81677606A320;
	Sun,  8 Nov 2026 18:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81677606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=VUrGsfpx
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:41ba:50da:6236:7eea])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 64BFDB0053D;
	Sun,  8 Nov 2026 19:10:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794161441;
	bh=K2BtXWkziekFSvI6P/+ngyBc85GfadAb6SoVxmYMKR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUrGsfpxubS68UUI94ZjHtq6oxoURSYR2WEbuBDjXXS8selYUAOAAnFDreFv//djV
	 TexaJ9Af2Bx+w6732lgKV0Vk7rfs4HLXdsEe9J3NN0a8BxuPgYrmuSbx4ocFtJKxW1
	 sEH7xboATxifc6o4010ZHj6Xqrt0+ZcHpqY7gCx+uFk+8qecBEXuwGJqpy9rqiRbAx
	 3g9XCltJrgSBCPhth1Dtt4iYV9w1SRAoAvPbTJeeYlgGvS5cRVCgW93zPpDR4ej9QQ
	 /arTIReb2WgSzKrcEFg/Z8dLsvFOBOiEZe+tj0U2+l96IkfpANyX6gA13vCR6UgNoW
	 QpeRRKAkAeGlw==
Date: Sun, 8 Nov 2026 19:10:31 +0100
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: lx2160a: describe the pad muxes as
 the DCFG RCW override
Message-ID: <avC7Fz2UstYb5r24@L30177.local>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-5-5a0063f1da9e@free.fr>
 <sashiko-outbox-203680@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-203680@kernel.org>

Hi M. Bot,

> [Severity: Low]
> Since this fixes the pad mux clearing issue introduced by the
> pinctrl-single description, should this include a Fixes: trailer?
>
>   Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")

No, it is on purpose.

This patch is not standalone: it needs the binding, the fsl-guts
override and the pad-mux driver of 1 to 4. 

Thanks,
  Vincent
