Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754396;
	b=gNahb4ZFhe1jmYwc7lU8IS/T4lU9eqLCClFNSACMIHtnPi5e+f7flGViBKdotcs2i7k1
	 SzKHuqYpjCWiPwhtFGVzOJ71AdzAIWogfE77P96XrASIw20U8oxjtsDJPDmp9HCaUHEi2
	 BwXkAx3I59sSA+cXcsqdvnT2iPlXORTPLcklMpty3HIqifkXaMuaFc16iX8mOqsTEYiDA
	 pIWWamPMXdlv7RZhGMt+78rUz6puLiq2ffY29NAz4ivxgOsnn2R6xVh2SoQ145LmG5Jhn
	 9Ha1lqmn2nG4smGsePY+na/oBJh3bpLC5e+Wz8O0MHR8RK/MmPMuCFXJ5YR4kwte7Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=J5sKs/Ne8g0Y/hsc5MX94/eXwYnEUUUICc3qiP04Drs=;
	b=ju7vknPvWowN2r0y860YiSlSYEAi2mZgJwc/VXQok53YolBx108nvsBpwq3HKzIpr1Mb
	 gdQXOruEJ25zB/aRsmiYDF1RSZyicBN72R0v9fTzZ1h2M2L2mY9BtAPdU/onOQWrcezHR
	 j6oqtJxfpjk5w6thsJS8egdbUlEfYbK48r76n+PbbWE1x3XlCLqLuVkKMH7jvT8qhcXG2
	 V8lQ90yOUKHEtdGQqxyAAmhjlNQ+8K0/0Or2EIsnn32rVuFgRCBAe8lwBwhTKS9w0s/ir
	 R6XR5JeQXPId6/clQokyrTlK41+A3I4Wn7cfhsk4uvYzrbEjdvDazBIO1qgScxVBjXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Nl4DtL;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A273606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 01:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A273606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9Nl4DtL
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so185811a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 17:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793754395; x=1794359195; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5sKs/Ne8g0Y/hsc5MX94/eXwYnEUUUICc3qiP04Drs=;
        b=o9Nl4DtLURVMGP/pqpzRaK/XBgQg/OzZEnYbFo3VOCQilITn7wIglm7WA19yhxw4iB
         QZl/30002Cze62z1vFuiKG3Th1KCudf5zgUaML9NedhRhqxIkr2Nbrw36FHfQe8VRLWj
         cf8wMbe7dxmZTpen3ZMunf5ggo2+/sRUH9J+vDs4bihodYOvw+MZZnBw41kLOEAcB2e0
         dXB/Jf92niG8ER592l7ywP3JAFt38rZN1bd9QgxvnhUHlCR95FEQ3VkOcXCYDiYH4E9q
         Gf3wPZ/gLefRGrE61hR2aF+FO1XQuly5HB6KggYBmNTjZGhM364pPXS/b4atdOwTINYi
         Znvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754395; x=1794359195;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5sKs/Ne8g0Y/hsc5MX94/eXwYnEUUUICc3qiP04Drs=;
        b=eOPeqV5GhXc50CYxnt09Asdx9Cg0FrnbHyyOAA41x/eYVebRfxjoK3cQptZIHTdE2e
         G5y2uvll33Xxe1d4ImPpTdUoUg8sCo2Do1GdkWx3IJ937S9+LGbSfbZJYNEC3NdYZliZ
         m4y+W8zUNJuM6rE0lSAdJ4WM5lBR6FapAkgJ+o+BCjFIB/aCeEB+ZlNM/kIJJu0NWimR
         lqK38xluyAu3+IrttxYcIBhkU6C/EQcl0BOoYA6svgRRJ23AZY9IJfEGkxLT/ktPkfwl
         G2ja+BKzIjM4TUcjQtu9Ao9einPiafgbA76v9PAhBwlCd8vAoUHvNHshoYP6lUFcAJuQ
         bJPQ==
X-Gm-Message-State: APuU4Z9+SjuLxzVBWcxZDFTvQ/CqrqT6IdEVTNrsAswmNAobRTbAQdm0
	9t8H6H7wvUSmaCYu9qIPMI7hAhyMOm3uTwrWWS5jP352bGyocgye4j+hQTGhwA==
X-Gm-Gg: AYBFou3kLCI4X0Bhu2eeQ3D80YfLpI+UcKlVkGfh1aMjJZ87N4V8aXeTkGzPXlRavVC
	v9CXDGvmBgWsOtQ8TLNuLUsXWSDJk/SX4sT69xjh6ZKvc+87MPfybgT37UZJOKLBXnuvWagiCNb
	Y339lwXtQEXc4CiH4rA5K0WAkEu2jTsqPlg3Ns9q3MOVv7FqVvEKr0k+XvDTFn4rz4ILYj1HOhA
	nqFTtDBoPx+jcSxucKncJ3v1FdB3pq9doqyFWZKJKyBvpzQpDaHLk0GPljg03wFckf68gfwr1Xd
	kCkn1ku+vvZlT+qNXsoGTDfjgAdooSsjCyI6Y8RaHtJrTwBko0YKHF9vrg+5qIQJZn4X1Cqxyg4
	wCgmXh7JBGh/5iaAunfCDV94idCNlNzo8+2/hb5rPpfnvL2bRVdjvFTOoW/n2u8JiCXSvw/j7ag
	sYd5WhoDTetc5bBomzpGfRsBNrc7iyFYOHbaLvjNu1ZuIdVC0PALZhBS1LmRYO6XrPtR0ou74K1
	b83mdMpKlA5ZscApT2jImurIA9wzHpCvjbNdBaaWfHIsuFm8drDkgxKL71wRh0WoU5rHLFRCfU4
	HIjRGhcmWO6oSI/AwqY8+Pqv0P2ljPEZ1+IKko2oiP2sbkO80Vi1ZMi4EtmvrlL3ADhDl/6cQdX
	oL750kvIL4F8tAWcjImGzmAjJokjhss1LMQ==
X-Received: by 2002:a17:90b:3b47:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3ae8980dccamr13161246a91.33.1793754395383;
        Tue, 03 Nov 2026 17:06:35 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1052582a91.15.2026.11.03.17.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 17:06:35 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 01:06:34 +0000
Message-Id: <DMM0V4WNNCZC.1A8N6EFFFOE1D@gmail.com>
Subject: Re: [PATCH bpf-next 32/37] bpf: Allow BPF_MAX_SUBPROGS targets of a
 read from a table of functions
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <sashiko-outbox-196291@kernel.org>
References: <20261103234104.208239-1-alexei.starovoitov@gmail.com> <20261103234104.208239-33-alexei.starovoitov@gmail.com> <sashiko-outbox-196291@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 03, 2026 at 04:12 PM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
> - [Low] bpf: __free(kfree) variable declared as NULL at top of check_func_ptr_read()

Not worth a respin.
The overlap label prints the message and returns. It frees nothing.
targets is the only __free() variable there, so there is no order to break.
