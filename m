Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795222064;
	b=YrRvax4qou46qnM/9ojVefpchTLKj4if4I40pQmRZtxVc4+Y87PAUEw53WUsir+QEi7r
	 I5n2fKGq7n0W3HqoBhVNFxHTzmcdjo6IQgVpEITw1Jj05urElmcFeUyiGf3Xo1YI4uzcB
	 3roBzuVH0D22GrnSVnKYKEALtHcI8Ig94bByT2KpafBP48vibjFHtpXjQfvCwNjyoIrB4
	 9t/O9gN2ZIyV1JIBIP3eWCFMCKefTliAC8ekbONoxWOQ2EfCIroo/TPAr+c1E9xH1aNJZ
	 3MqqT1A+ooyXv4ogB9juWlE73RfLfmX9EhAPyjSHTq3YsQlGiAO+elSNJ99GpG0XJEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=sLsPwPwC3HlUczdbFxujwCzg8Up2Cb7L28zak52ZMIs=;
	b=FnyES7Njs1N8EyT/1m0agYJZb/sOHb8F0W0ok7OqnYjCDmeGJwNHBvEye6mFiDmqLU07
	 1EEkIjWkGgh7YHiEmeGmb0sIIJSGlYVhgF9LniacCfVAe7VGf8SlbEcPy2s0SIMffdgSi
	 u+Qe/J87xOZqGOi1YR/oyJnSA5e6VFNRBFpdPyODAJVTNbPLEwGblj+KUjUaaChH87Yu1
	 pjTMgqCfQ1lkwszJ37Jz6In+M3jxMc+HXEeM5cStbvw/kHLlwcmDc6dvaOh2B42joNix6
	 rbmWAYmM5L1yjxaw1E8EoSydA9INdIsKmFBvwKwrp5XPXrsUrtBjuxLAb/JJNdJxdqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Gs8WNo1z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D660606A6A8
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 00:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D660606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Gs8WNo1z
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL0B9se3094593
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:47:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=sLsPwPwC3Hl
	UczdbFxujwCzg8Up2Cb7L28zak52ZMIs=; b=Gs8WNo1zysKKvjTMgfaRYfHr6rj
	CjVTink6G9q9+weAsB0imF3TTcKWjSaWg2uISYkciZb2FyiWYf+6ueH3uAIhcGhR
	epLLvcVq4UeTWS/DsqtG2Mq9MBsTa4rwm38Tbuelq8mwFmoVRc4QXVoOumSxUBX+
	P0ov6PmgSAeTZxYkkdp9ZNfDeteMXRu7UWZ+Z1yBUpsc0zItdYSH09UacgaIRh30
	eYNpm6R07ji6h/Kfq9xhMDoOu7+p3Jj0lg+PDmP9kt7pAZGGIV+Aj+5nfleL/yV1
	ftCrDHhO8KkeQ78gEHV3eAWMAUHhg7oERhPYexh7TVlxbrRl3JwtnboWWGg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tg2k0cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:47:41 -0800 (PST)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so1380185a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795222060; cv=none;
        d=google.com; s=arc-20260327;
        b=ET5+AiFNLo/qnR7GUYR9qf01vkHuqefgll2SD6BSd0NVUnMFn7rwEi0S2yIDC6AOL/
         6yzkoMI1g4RuXsu+7f+YcVLUqRZPwUgKB+XNGuNt2HbdT2FaEhV8z1R0HJZej5dkNhqd
         STQwbxP3oPDywehQJ1tfsG6NPrDTvgFp8NgrY3qNijNpxOOgm6tO+9jZx8x+24idFIOh
         /azh5PKEngbNMCdPxHEqDwAEI6pVQC4tk1zi6dT0n5qRcHfwmtNHxD0jotuiKDkhCmV3
         VYh//uV6VayoRqllDlSQcgU+CX7EwDhM15e/Vhjd1MTyKHrTxeV/lUMpQvvqYV+6zlbF
         YsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=sLsPwPwC3HlUczdbFxujwCzg8Up2Cb7L28zak52ZMIs=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=VPZRW4jfU8Gy1MEVRjjDnIBKqoIj8H9By/vWj6RjWrDXi66yUy3BBf0jYgN3PqsuGb
         A+kJY8kr8Zc/iv+Gah7nCro27IAV5i88AoXngIr+OXkCwL05uFlx9r3toSvqozzsBmAQ
         3iA3UDphBdzseykBPrlb/QlBLI6rox260eAgWPD/NJsBj06p/LQINzMzyAZ/P1lgEOnQ
         /vAoIDLJhTEGO03nuBffehrGAFkpJpKCiMHUz3tpBYsaG0pen95GX8Co8lF6VChztmES
         MJVAaP9mP+FB7jLdyOw0ATqmAxbqC9R8geqh4vwBTAMI67rZbevSair7hMRXUYF2H+za
         LsPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222060; x=1795826860;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sLsPwPwC3HlUczdbFxujwCzg8Up2Cb7L28zak52ZMIs=;
        b=Ek/3lZk0px96c1XsQnQUAct9Epj6GCJDVqh7hUAqSLevD6fRKylx+E8BQXuZTVCI4O
         8IW/8fWpLfJ0kLdkPCilJBxs/+66R3CzC/E68XNcty/2Brn2awrtL7N663eSVCw9li/C
         CUAs4K1e2mTBKUr19FMhFA/yNVqIfQwfi+45Eugq7XjKkokC38+V7AxopZMzVzBWwUHz
         1spKMQ4/o3BGE7isYm7Ylg+cz4OmSJM2OC1x6UQfQWxhl6E3ayMDOrrjrdvTwGfTolxC
         j9MaSkNUUquPQbzloXOoeIsyEhTtadMxGJr5U8N5P7UYoGlnZi99uhBLcjPJKrLbt8ZI
         n75Q==
X-Gm-Message-State: APuU4Z/5ztMnWWm5ENhANtWKp4/lPX3p6fpzRH/sGVFt0QefY0gMfcuT
	75hgg4opsMLhIw+s/2yZUn5qX3uW2ZNzlPBoN3c0HlYB5BuV/EWvJN0VpOLVipK9vI7rrxKbbmp
	BzMg2Pj69xKM7wrutYn8HNJJRNwZ1vBb9rDskvX9zv0cuhnbme9Z23CF3UScogXf8EEO+QW3N08
	zgl1VjoN0WsNqDGLfHFBxEGe5W482aVRj+MTwuiqM191HNLBXQsj3tOg==
X-Gm-Gg: AYBFou3k6NaYRVyG2rOYcfpnRLxpsc1l7KLmKYjuG2Tbrxs27HXAf7Ar9JCZZobsg4v
	O1X83q/LP8NsuprLVyo/sUnH1QymOtixfgt7fgbbj3+TrLQkydJpPKhD5VSzHe86A200FBLmUND
	UTHeDlgGuc0mq5cg7NJlj8O8pspIUaZE5RZrF6tIhIGPLhYgjECpF2HxMrTFLwAdtGQqV29+FX1
	L2CqbhDzlwiEzrMyxourRon89UkfST7Zjs97PEGEE6Z0NwVGAg=
X-Received: by 2002:a05:6a21:880a:b0:3f9:e8f1:697e with SMTP id adf61e73a8af0-4014bc58241mr4169601637.34.1795222060099;
        Fri, 20 Nov 2026 16:47:40 -0800 (PST)
X-Received: by 2002:a05:6a21:880a:b0:3f9:e8f1:697e with SMTP id
 adf61e73a8af0-4014bc58241mr4169588637.34.1795222059632; Fri, 20 Nov 2026
 16:47:39 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119013103.1092559-1-toddfreed@meta.com> <20261119013103.1092559-5-toddfreed@meta.com>
 <sashiko-outbox-224311@kernel.org>
In-Reply-To: <sashiko-outbox-224311@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 20 Nov 2026 16:47:28 -0800
X-Gm-Features: AclHuK-exnYG47aNjV7pMM2O1AFYtercXpmnwywLfO3PdqhYjuMmQGCGR5i7yWw
Message-ID: <CADh2yMyhWxKWTZc2di8OW7H0n2kZ2JL5-esAco7yYju5N_pKHw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 04/12] psp: add support for socket-less psp associations
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAwMiBTYWx0ZWRfXyXEgmb3xTbaZ
 QeEI3hSv0xAK7xfl7d4/VlRpbi6rsSyKnTruYVwivl9xu9ilZa+lyDdgDn/8krROH997aA8hrwr
 PmucRCfAayNE/5ZMV03VN90YcxyXWgA=
X-Proofpoint-ORIG-GUID: NwKdc6ggONM25WL_MjKnumgFfxBVE39l
X-Authority-Analysis: v=2.4 cv=NMJAaE6g c=1 sm=1 tr=0 ts=6b00ea2d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=0HLFHH1_m2ICFn5tl9MA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAwMiBTYWx0ZWRfXw6CpqK4eEtvH
 tWsSM8eFTatjNLcX4yJGBQW2n+XWAF7l+8isJw5MzotRTqCVjw6zsMnoflG4ubwWQMLyeZlXWp7
 E7suc/mnn25oQ62HnUH2f95+u0cUDvVCN+qXlmurui+mqPmSRZL/c+ufPs4M7YPToBxvmb5Ntai
 /YOiSsXmwL6Mo/Tm7JPUWa9IxPZ8GsCnslD7KG9NfXLxvi818Nsds3LtgOQm4FKnYU6Gln0IGz9
 1sRoWph1cwl8LbTpGFxLJ6PIW8UG6zjlGuJkvitPwHW0gYRqMc0GgIS+fPYcvdnZWJC+vhPhqBd
 H8on3OETNDCvOwqh2oXCrZcc4YhlyqYnqIOmN5u5+TzSI706LYOKaIYqvZJdhthqJPIfZdvjbSn
 HaVA5ey4cB1DH/HsEy5Xedk28ZNI09+a8oECSKwHxyb75l3jksEuKywmsPuBbXCFrjI4mnDymoi
 X+4H5PnNOY2ykbS3TNw==
X-Proofpoint-GUID: NwKdc6ggONM25WL_MjKnumgFfxBVE39l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01

> [Severity: Low]
> struct psp_dev has a kernel-doc comment describing its members, so adding
> sockless_assocs without a corresponding @sockless_assocs entry will trigger
> a kernel-doc warning under W=1 builds.

I will address this in v3,

+ * @sockless_assocs:   socket-less Tx associations, which key rotation
+ *                     doesn't move

-Todd
