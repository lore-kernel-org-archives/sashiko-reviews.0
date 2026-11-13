Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556288;
	b=yfj/endiPFFHWevEW4SS4AeFwNaD52aPiImkQMxvzR8pI+eQUZFKuvzcZHbwGiLGsagX
	 lbxOiM6ZDIHrNdwjpZCoBP+/SbPCUOdhd9SBr2+olAt0DTCahLT1PncsB+3aujmWkSSx+
	 PWTeSzjmW1F7t8R2qKPPecDh6zo+uu7tTgfPD1kz7e4ZZYpuvRG1LaaCVxWGTHGqhmh4Q
	 04zo9ZCE86G7qBinVrdaOXZQbpk3gYeetDL2xvFDNkuLkKKd6b5BYCdJZMLjrd3gGCzsa
	 T8qKb5YgsH6kXf0+rhEcKVhgwFx5kYIKEZ+zTMx7EuY+mOfPWjb3P/FXCDi4pHa5Xug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zHE80jLQk70fW69I68JYDsQ3DFTnh8/DiUynz1wUO2s=;
	b=MnfZ5YOIZWX7sB8Vz4PK95islHecjHTP+gfFWwwXHiXyhhxTv1+xn6MtXQdjXaJ8a5RE
	 f2UEbshRj/mXVcI1rJylnURsQs2KlFC9jtmKZMOYz805DU+1a/o4bfhnxNAIQzcvzxeZ8
	 2Nd5zXsz2JUO1iKrTabUh99MNVr6ZCEPBXt9thTasVc9Hpe5goefEkmSgfmKqbXoTQ22A
	 Zy8xH6qwnegZhsSzgJItkv9R/RowV3/aGfUwC0fTFcXcdKwiQVGog9kR49Dlhriwox+iW
	 558yKE3bmmuZZmRQDiJ3JAoY4VEQ0gD3VR26AGKFYrP9tv/anj8QVvWgZQaeNub/+SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8zn3Xn+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JAOVP/z1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4CE606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F4CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8zn3Xn+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JAOVP/z1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD574Oj3717384
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHE80jLQk70fW69I68JYDsQ3DFTnh8/DiUynz1wUO2s=; b=h8zn3Xn+xZabN1wI
	Kz6LcvdWdRWg0JOlOFhJZ0uhlEsyg5OTq1SuHV/hBEgnwSOOommJKHIapR3PRJhr
	RdiUT1nqwTG/MOEeifLme0V2V3PP5t6ByiX0XK21CYvHCpPWUktgXnFk9mQ/akz2
	sgCA7ivV2a3EcM9tbI8fhiPWp/akJdPMyRGWcytI1KwEEZ0xg368rvQC81lotaOc
	4cTQx20bAiKsK2B7WWdxj8CLdU+n4kv92T1OyAkpyZ9cWmuwVXwih7Qn3IaW8iQF
	PjuowGaHnyU2F3C8wGwUdYWFPOet69A49vMcqOhSavSLo77YiH4gcn2OKX++PPzN
	de+LnQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhc51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:51:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso342609eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 23:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556286; x=1795161086; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zHE80jLQk70fW69I68JYDsQ3DFTnh8/DiUynz1wUO2s=;
        b=JAOVP/z1vxNSn7dPKjeZ/W7VVAL+bnqra5c+JCQGJ/0BDvfgtQtqojGh7DnMiUJtuG
         nfg2cgAqCprg654H+mK0xb2YPUZ4/HUAfWEyxIwL9K9TmLZUUx95am7K05mzKiU2NBNU
         8ZlME0+KkpTgcALeS96P2F29Cm3jut6MFzBmPABB9OY/MdwpDcJEzvTVAWz5d0b6DZ31
         8FbnTqbzGNdOEr6rm+vdzkX5K+47zPWfkkWSEZokIqnGcZb55SB9O3zFa038R7kYsPXw
         Iz3icnS9sYoFZAOsbCPyUcS9E72sutKUoTQVuJKRI70vP7RMSV/dmBhhQt21zDtXnVLn
         a8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556286; x=1795161086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zHE80jLQk70fW69I68JYDsQ3DFTnh8/DiUynz1wUO2s=;
        b=wO2t+JosNRgaaldjl6ICcEf8CusUcDM+2K7JTWbNZWMgjObgFPq6aJ5srRH3P6Rjr/
         vkNRZpAgJE87mdqqgfJr5aHF9XcW7w4GBW1sXENkBZvrAdRPebcxZQT3k7f7oNu/7hBE
         TJZMLjQV0wic5dpfqr2+tKs+BussUKNuNiMpRFjc8ugXBRBjTikG17mjZCSjSEvzIDOj
         pbvI46tUPlD9McrzP48ib5/vGr9VNP1DCmNFFhcUIkYKhPcLYy0hSlg+0ERFWTh1Wzk4
         mDcKSspVgiGsRxAn9g02YGLIsNWNETUOFHDdjaB/YdAenUZHcjrWq2J4UDVzSVMvUOLK
         gJJw==
X-Gm-Message-State: APuU4Z/HEdxk03LMh5ffKCaNA9sH8rIpgtS1EYf52xtAj1KmMe1pJSEK
	6Vpt/91BpaWRzyPFUFgyaAXl6/unq+hh48XxbNB3rOD1jgqfL7WK8vpYYNQrTyBn/faaoUnjsIa
	QvFHaQ/EirYJg70fupgWCiLCEYcP5HOpxhqriiBhCUEuV3/OT9KTKtk+jEjncBhIQ7/1tuetG0C
	BnkB0=
X-Gm-Gg: AYBFou29TjvmhCAN4AqKL9WZM5WGfKQDWPbNEAlw5y9mFj8KsYv51hFirH9J+y5h4Uy
	C16rsmkzuuI88UGYyPHXkCdDKh59U/emD2qGkfZGFe+4H+oir9cw79Jb/x9TeNQvyeEWefl4Gdf
	zEpm5zN7XAC8hiHLxHjlJeVTQJQguWsqoIQW6x7k2Hu987Zx+e/S73vDDzFUCYlL6GnY4ID5G+C
	kZdlN54yiVYJOzsCtZ/rJwGldEViur9dYIpmpCsN69AXHW8v1ON98XoJBMdFC+kzbjgUAI0Rgx2
	f32+iRkamBofE/+65+WesgCLUDVb2Bq4PgdtR8kFmOq0L6yilpUrutmV/JY+5Nr9sjRm+1dpUa2
	cbKa8TvDZkcDgJSRRMh+hTEJkkrP5uhGyDoyakecYxpD+4FErXm81wyvctnyxrGONgbfHNxdUyZ
	D/
X-Received: by 2002:a05:701b:4182:10b0:1b2:5128:df1b with SMTP id a92af1059eb24-1b5031b7dd3mr1777878c88.45.1794556285567;
        Thu, 12 Nov 2026 23:51:25 -0800 (PST)
X-Received: by 2002:a05:701b:4182:10b0:1b2:5128:df1b with SMTP id a92af1059eb24-1b5031b7dd3mr1777854c88.45.1794556284807;
        Thu, 12 Nov 2026 23:51:24 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm4648172c88.0.2026.11.12.23.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:51:24 -0800 (PST)
Date: Fri, 13 Nov 2026 13:21:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/8] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113075119.hq4ak5njyknwno24@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
 <20260926155937.624D11F000FF@smtp.kernel.org>
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
In-Reply-To: <20260926155937.624D11F000FF@smtp.kernel.org>
X-Proofpoint-GUID: 5K_h3NzqvTOctIGeFtdTEA3GsaQgHirS
X-Proofpoint-ORIG-GUID: 5K_h3NzqvTOctIGeFtdTEA3GsaQgHirS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX2vAFUKuQ3rwh
 L5GySY980VRGYFx7sJK7pc7dIiIc8PUdUQFAjeHCggiK+a9HdL0RK/TctGsGTHsBj521TeU1GsA
 +kJAME1lTT+D9WVKNW8myYD7iLmvo4Pq0LK4OIJB0UHms9UjnCvlC6Nxyoh7UIWj7ngZxKfq+BI
 Nh5l0Sy3L1gSXLAC8ZMWcNZ6GvwTpWUFpu2ONdJ8RzfhGj8EqS2EMFmLeP5ZHnsFUDOmOBaC2C4
 eYD7EAVTvm+V9fpbj5sFhUK+Zc+TWBMcEE1/wunbdFVmOFPvkYL7BlHgjFsFARhsbme0nTJxqFR
 tLuxY8husrynSy9UMXjVexuZJ4B2cvYf2DP6KPM4UEKGc5b8VQaLivoo1tjTxaGpCQbwlAW80S8
 ILyQAxDbZastNINLrvVDF3MTlTgNj8eGd6uD7+K3K64KRdXPGbTWlNcT6Yn5lSf+RJf8dHodqjj
 EGN3KW1r6H7gxYhEzUQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6c17e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=y4KpbDpA15XCOura43EA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX5QFw8WlXvsDD
 arZFfwXEnye+ouv3hyz9oykx6sF1QMTHByephpXk5zEyswUl9mpM/jF624/cB/4r0AkHIkbJNbM
 qlemJSaX0+gtCByoibKcPWlCNb1Hp6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On Sat, Sep 26, 2026 at 03:59:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: ipa: shmbridge setup bypassed due to uninitialized ctx->use_tzmem flag
> - [Medium] net: ipa: memory leak of PAS metadata DMA buffer due to missing qcom_pas_metadata_release()
> --
> 
> commit 5216b43b65b5b9e8f76798ae9a011c6d5ce85515
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit replaces open-coded memory mapping and firmware loading
> sequences with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load().
> It then uses qcom_pas_prepare_and_auth_reset() with the goal of
> performing the shmbridge prepare step required before TrustZone
> authentication.
> 
> > diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> > index 14ac2d2faf7c2..6964395caedd9 100644
> > --- a/drivers/net/ipa/ipa_main.c
> > +++ b/drivers/net/ipa/ipa_main.c
> 
> [ ... ]
> 
> > @@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
> >  	}
> >  
> >  	phys = res.start;
> > -	size = (size_t)resource_size(&res);
> > -	virt = memremap(phys, size, MEMREMAP_WC);
> > -	if (!virt) {
> > -		dev_err(dev, "unable to remap firmware memory\n");
> > -		ret = -ENOMEM;
> > +	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
> > +					  resource_size(&res));
> > +	if (IS_ERR(ctx)) {
> > +		ret = PTR_ERR(ctx);
> >  		goto out_release_firmware;
> >  	}
> 
> [Severity: High]
> Does allocating the context here leave the use_tzmem flag implicitly
> initialized to false?


yes

> 
> The commit message states the goal is to execute the shmbridge prepare
> step. However, since devm_qcom_pas_context_alloc() allocates the context
> using devm_kzalloc(), the ctx->use_tzmem boolean defaults to false.
> 
> When qcom_pas_prepare_and_auth_reset(ctx) is called later, the backend
> evaluates this flag. If it is false, it falls back to the legacy
> authentication path and completely bypasses the intended
> qcom_tzmem_shm_bridge_create() logic.
> 
> Should ctx->use_tzmem be explicitly set to true after allocation?

Should be set only if this is supported, like KVM. Otherwise, it should
remain false for legacy support. So, it is correct behavior for
the current code.

> 
> >  
> > -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> > +	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
> >  	if (ret) {
> >  		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> > -	} else {
> > -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> > -		if (ret)
> > -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +		goto out_release_firmware;
> >  	}
> >  
> > -	memunmap(virt);
> > +	ret = qcom_pas_prepare_and_auth_reset(ctx);
> > +	if (ret)
> > +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +
> >  out_release_firmware:
> >  	release_firmware(fw);
> >  
> 
> [Severity: Medium]
> Will returning from this path leak the DMA buffer containing the firmware
> metadata?
> 
> When qcom_mdt_pas_load() is called, it triggers the allocation and mapping
> of a DMA buffer for the metadata, storing its address in ctx->ptr. While
> the context structure itself is devres-managed, the underlying PAS backend
> requires callers to explicitly free the metadata buffer.
> 
> If the function returns without calling qcom_pas_metadata_release(ctx),
> does this result in a permanent memory leak of the metadata buffer on
> every probe attempt?

It is taken care of in this commit[1], which is picked and was mentioned in
the cover letter.
[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2aa8fafc08e777e9da356307c1a0117e7f4277cf

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com?part=5

-- 
-Mukesh Ojha
