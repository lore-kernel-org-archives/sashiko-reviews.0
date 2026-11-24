Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524691;
	b=DOl1C8W64OvgDOkeNawWIWbDo/IZCPplNlQK8IgvebcCSu/j+H8j8QDotNAcZoYRqUWE
	 SWcJOvGyRj2iS45UmvadcsIz95QVPDZSl/3dXKuVkA9/933z5vCLTJB7i/PSGRhsjR6jP
	 V9ZUjgB5Lnul4GCPd1FMC5vEn/7/aGrrP/qz9obTpaFZ+wSv0WQKvR3KnEhyeKtsp+5In
	 For2jRNurm3c+i8K7d8/aCTHQFTP+9u0GW06gNrLebmNn5NV+HUM94ErOlOfvsyI2Qe6z
	 ebIAqyVo9WyiVVZnkLnChSKKNWV9M/aK+s/ua8kBSvN1auUBT3A8jWPttqxilaA1gbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibJhgbs8/LooGaGNxFqStf7aw570tanCnoATpq0oEzg=;
	b=RZZTxLxDEgu+V91/Gm5Kqpjvl8INJIhvEx/a3s3eJNQE2iZwIKQl8BQv+nQ2wlqjWGks
	 6gIoFN5AT9INNrC9dVGbd3R4DArhAE0LyyxhzCSVz7sqRmKI3C9kES6YEiFKT4mmprMsd
	 SoSwAEQxGFNKXBvGKO4eYOGVQYuf+90Oe2np0E0/Q9/0pov+1G+giCvF3lJ7iClJq/gaV
	 LRLqzt9bkIQKzmfA2ReBGe3AOKwbBwFHjT/AyRTkYRoIVjv8Gyr97wZS4KgKaCPW/e1oY
	 UIvKR9qJ8F0w5TGYQ05uD/cAbXEotcjQBhcK/RtxjpVGfQLuKwCJJ/C3NehwajoGRBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T8s0O8oa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Cthgp/nk";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C8606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T8s0O8oa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cthgp/nk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuh65601603
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibJhgbs8/LooGaGNxFqStf7aw570tanCnoATpq0oEzg=; b=T8s0O8oai12DBKf/
	c6wBIfydU0YYgm5yfki3odjZT5fr1w+ee4GFuopg2XEDBarVa7ow3vdvkswIRkf0
	77GkTq7/82eruwfufnVMiXvuyA2bkdsy2jZ2ZPMd9czm0qjo6M9y2pJjSDBnF4XZ
	aJXLuHntIlrJouKU7EOQ9fbyftrWWYM99Ab3LGQzLeCkKPPptnrdnzVl++fJ9Gnm
	o0bFNBsRz0xlzIsMIvIthD2LKQ7qD8X6Sg4wVcKwIxiv1ykLhxXzG9i5Ca9tFf2d
	i1nD7QOSPHgFIxjxZcEoNi+i0UvlqHrcoNdbfMk3Zz3lI5IUMsczB/1/v8MtrKdh
	TFXudw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky2mt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:51:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so5495401c88.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 04:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524689; x=1796129489; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibJhgbs8/LooGaGNxFqStf7aw570tanCnoATpq0oEzg=;
        b=Cthgp/nkwWxPyvry1ytIv7lKVeIEmHJvJFTXpXkbZKydFzuaGQcjxLB31R40YUPWaX
         URORbB9l5zgWpZnGN7PKzuckNRyR10LTj46vKrUTaCwzPkjEz1eSCB+Q6a+K9/QpiU9L
         1OBQK2n29IZyLFqgbKecx7YjyXnl4Z7JoVzU7RiwY1dLfxjzaSIDOGzyvlS1PqkSZ5AM
         FsJ8M4AkyxkMV2TjaUnrmTEFMAWc4R5WqhI6GOCUvPEQ9qU4gabLJqX6Wz/zQLIgzYRu
         5gBp9oL9WPamobfm3T4c3HR4VaP56SWtyxba83IyWe2q5m2koWBIRNNJPR9ZBGLvpTUK
         Jdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524689; x=1796129489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ibJhgbs8/LooGaGNxFqStf7aw570tanCnoATpq0oEzg=;
        b=rX8FcOSZ0KAdDH78BEXORo8BsOwK/w/Rs7BDF5vL1teemzH1hsyyzUqZn9av3ypAG9
         O1bpV5rqLNRjwTL2ptUonh7JqBpTYg3+dsatbsFb88yykEJuRZvIdnpPCTOIzIdGusSY
         XLhklyw4oh5KitPP9+0POmNDH2lcyzO5mmDS4vp0FXCT1Qzz4HDih5Y0oKzWiFLrJyTX
         sPLJTVFmEgQWhAnhqJbjeMZD9H/VNPBuNE1k0XJMa87+ILE6qxSzuUjxv0Kc9AGaJTWN
         0pR8pSQ74G6atSpDKbe4fWxbdU7ptOJmTF6kTurWP5SiUgekiBzX7G2t5KntDtAwlH9g
         JJfw==
X-Gm-Message-State: APuU4Z+RcPrA5WKnDbYY0raQnjH4tuzBP6E1zK2+PTa4XwirO5oeUxMW
	mNJY/QL/txzYzBXyzeP+3FrACMxo0nBmkSLCnKgCm8eGhGFLy23PxbgDREw4bJ5YLGZUUifS9bS
	za5zGMVgg4IxaTDnyJ0+fjg9HyIFwaMAe7exjdBM/y/lyb4J+Yv+xMMw1ktq92N6iJ0h0PiB2CH
	JCyvk=
X-Gm-Gg: AZFdTZfXvJJ34yFtBDKHLt24pQQ/ysX0B/6dOf96IdU8U9nDWlGbnKoa/NCu1Ke750r
	1Wk40lYyWL7QE3d+lDF3iw09lp7UQ7kkOhtLiwjYicGTtRv2SPTVbUWrAaZejwqslCZlczR2BaX
	AkNY4Qg1iNJ2svmLn74yMjcqEU3T3DkjdHbiipJFfMWnbbMnnrvdX6ms8PZ7H+q+N8SfbnMC5Qo
	qz+3RLsLtNW7EFfIxo0AJ+oAuxTILKpyw1hp7EhthL1uqCvLQSGJrBqHlMTtRZb7kaLUjIT8Oiv
	Dj5/1Vj4AlEnM8hcHSMFCxlIfd6Oijs+SHZq9sT+9IWdLQWGH9B3kxELC0XHw9+Lsyqido8uSnE
	jfe/xulLLmLwbcdxq1EcpFW2RitwRS4UJVQW1RvofBQqaUuKfGoiRvsqCTYNPOwddEzR5uWmGd4
	ff
X-Received: by 2002:a05:7022:b051:20b0:1b4:e533:ff50 with SMTP id a92af1059eb24-1b556912ca9mr16371243c88.40.1795524688634;
        Tue, 24 Nov 2026 04:51:28 -0800 (PST)
X-Received: by 2002:a05:7022:b051:20b0:1b4:e533:ff50 with SMTP id a92af1059eb24-1b556912ca9mr16371218c88.40.1795524687943;
        Tue, 24 Nov 2026 04:51:27 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm34495458c88.15.2026.11.24.04.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:51:27 -0800 (PST)
Date: Tue, 24 Nov 2026 18:21:22 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH v3 6/9] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261124125122.dvdl5y4lky7zffql@hu-mojha-hyd.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-7-mukesh.ojha@oss.qualcomm.com>
 <sashiko-outbox-219165@kernel.org>
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
In-Reply-To: <sashiko-outbox-219165@kernel.org>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b058851 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=SDal4quw-ZMABC504UwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: ai80BXMWqYJRtnhhgKllqBW6rpQRv0RF
X-Proofpoint-ORIG-GUID: ai80BXMWqYJRtnhhgKllqBW6rpQRv0RF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX5bCFl0UojMfe
 Fw3WTpPblwGGkwt4P8z+z6UsaLzW5FmJTsAv3Qh2k7HwuN4X5FzGN0AwazOZp2WgJrJUqp2dlxX
 s32LZNmdiC/tEzU87BxKIdR8b/Y4iPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX5olWUJYWlecN
 Bm8mjjNsgfyVn4OTBsCE8vL4QOWw3kZdEkl+a96MYqcEmfUqC49L2IaYEIO9V3jpXbO4hWGvrct
 eMaSXKNDiRBRz/eoXPYk8Dl4EyvkpN56miJQkDW+8hsCkWHv71KO26d+zZjA4uShANp6cd9Q13w
 8DBj0VG5T85Cr7yRpUKbCAZg2Xi7gL766q0ekwY6vi/sHPXQk3memAQYj1XkseDV9Ay1z3x1r/f
 r/+4LI4OaqE8kFdBvxMujm67vea8a0eAiHCSelXBGV6f7m+PP1deNfaLV5YdZd3MivOTsXZQRlU
 cosg4/kvXQAWeq5fWIJmIwra88v7TcyrTWI2+635MSnqVjdWy6Hah+sBetz6nxOsvhRxhWdcg3m
 sI2X3vrfUz8yy5FaCsCipTu1Z3ME78aMMoAjBlVhpeY30RCE19vTsBL+nvNRnysyq7WkhmR+77F
 y82MJOpnKxgDKv7HvYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240050

On Tue, Nov 17, 2026 at 04:24:12PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] net: ipa: leak of PAS metadata buffer in ipa_firmware_load()
> --
> 
> commit e29d8ec88fcd553654746e0eff27a3767cbabafc
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit replaces the open-coded memremap(), qcom_mdt_load(), and
> qcom_pas_auth_and_reset() sequence in ipa_firmware_load() with
> qcom_pas_context_init(), qcom_mdt_pas_load(), and
> qcom_pas_prepare_and_auth_reset().
> 
> > diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> > index 14ac2d2faf7c2..0a37741c22858 100644
> > --- a/drivers/net/ipa/ipa_main.c
> > +++ b/drivers/net/ipa/ipa_main.c
> > @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
> >  
> >  static int ipa_firmware_load(struct device *dev)
> >  {
> > +	struct qcom_pas_context ctx;
> >  	const struct firmware *fw;
> >  	struct resource res;
> >  	phys_addr_t phys;
> >  	const char *path;
> > -	ssize_t size;
> > -	void *virt;
> >  	int ret;
> >  
> >  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > @@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
> >  	}
> >  
> >  	phys = res.start;
> > -	size = (size_t)resource_size(&res);
> > -	virt = memremap(phys, size, MEMREMAP_WC);
> > -	if (!virt) {
> > -		dev_err(dev, "unable to remap firmware memory\n");
> > -		ret = -ENOMEM;
> > -		goto out_release_firmware;
> > -	}
> > +	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
> >  
> > -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> > +	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
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
> > +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> > +	if (ret)
> > +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> > +
> >  out_release_firmware:
> >  	release_firmware(fw);
> 
> [Severity: Medium]
> Does this leak the metadata buffer stored in ctx.ptr when
> ipa_firmware_load() returns?
> 
> Previously, qcom_mdt_load() passed a NULL context to
> __qcom_mdt_pas_init(), so qcom_pas_init_image() freed the metadata buffer
> immediately.  qcom_mdt_pas_load() instead passes &ctx to
> __qcom_mdt_pas_init() -> qcom_pas_init_image(), which retains the coherent
> DMA or TEE shared-memory allocation in ctx.ptr until
> qcom_pas_metadata_release(&ctx) is called.  Because ipa_firmware_load()
> never calls qcom_pas_metadata_release(&ctx), the metadata buffer is leaked
> on both the normal path and if qcom_mdt_pas_load() fails after
> qcom_pas_init_image() succeeds.

Change https://lore.kernel.org/all/20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com/
is present in linux-next which takes care of this.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com?part=6

-- 
-Mukesh Ojha
