Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799176;
	b=r/hfrIobfMqo7n2+LPAp+Z2ypAMFM2E3uB6YPUgWPUuUqHtfAI/XdHDCnptXrC3K66yf
	 IqzGkHgPh5Bu+jLVzUOYq7nOYTCf6zm9scay0nEASEb+qe+piSiL6/O8TaYASIs+NIYzY
	 bL+2fouegxeHj+n09fnY+Ed4/aprrY4WovZUSYAaSooHmW1ZRjWaDvVuWp/7zpiy3jWk6
	 do+wy/kgwi1ZiNXtdeQInbFF4HYF/DuSjcjMxhqQoM978oJVOOU9KWMNC+NSrBsoOHxtp
	 15QSZX/VUD7oWGUF0LAOiXNbLukaztWX90ZOqeAP/yNNDH0HS9/3lfGlmeZ88LzwlPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=;
	b=cBaZM7RIcbm7P+ejFCJp7cW7i8A/OkfPj6Bm5BY1LvgGuIAQwfkgfjusYRqn1sXuimaL
	 W/kqhxhQzTCbWkemc+qW4zDH5SFQOQttDIrAiPzcu0TDop3HGdRKmO+yIOJ9dPrroynf1
	 Af6V2j7HylTPcqDZYUuk/DRRZHjrL32/1GIw/BkSnRTdkVpFukZEIpV1hT7f//D+bGlwq
	 vJasDlfZKjNazK82f2Ig5p7MBduIf/V58i8HIh05/eecFvgvjNYfnN6ISUZiFggv5IYox
	 ZPFZIgc2LKP+scnbmoLDtEijj314i0jn06QgHofkl+dnfQvtas0PIH2vUTTs/UBc7wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKTIDrmZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QECai4Sd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE82606D808
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 13:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE82606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mKTIDrmZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QECai4Sd
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba2rX1700494
	for <sashiko-reviews@lists.linux.dev>; Wed, 4 Nov 2026 13:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=; b=mKTIDrmZLtH9mydX
	KLC6ewG44fufe9YFnXCDrl3yWVJjwADzEGhWI5oMhm3aQJfiLsbjXcmhwyzDJeR0
	NUKxYjjjUA1zXKvDYMnE4s7RMTz5vF0xfLmhkYQeYXx4oLv8ItjtBFPcahWixVmT
	U8STKmQh86DQz4vvwZEKKCsKGaK0247SntthylI+4oe6JNfv/maKEO30/9ExraZc
	p4iPsgx1HYJliUk+fRHoZH5jxDP+DhQhlUBuVzzUhu73W0e8cLpGCt1qibeOVcJ2
	cTEdDJu+1WJKXo2xTEW6qA+lFVul+9zpi5kGWkoiCfbGnQQLJ6zkO3yrW2QuDjdc
	/rKJdQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyggg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 13:32:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1326675eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 05:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793799174; x=1794403974; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=;
        b=QECai4SdZEtjHy2kvW/mGhBz6YuHWV0rhTRaLGsKuQH/s4TB30kje8NrBHqSrKDuI8
         QW2BPt0RUpoKI6mXikt07rQfFxQOCIDAIKFx1vDdF4rbvd+WaiMPL1T4rEHbb615qpUd
         LEbNemiAJb+nzwGs2TsZQG1buMpAqDKLHvHbyufmY3r06e0i8fOJbfB97mBvzYo+NSsx
         zu3WtTppFjEwTRJBfAoPlQ7OFoLfgvDbxsn0eeuAoguuLzDbZxMqVMM1MJh9lRZ0Oe+M
         bbpdItP8GNr01KYQ1t59m/NQIGgSn+RhtSP1/vvtAEFRMjUc1Kjn86QUUCoDDCbRY2RY
         g+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799174; x=1794403974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eABPHy3eglE/7+B2naifRuYawEmTd5OGw+DU2a4YoLk=;
        b=sHkx4EpQImno2QgH53Y5s/C7PGtzevdiusgt8HCxhDH64kQh2vxMycokQNHdORtJsV
         H4wQG0mSC3bCT0seawqEnF/0ntwxCFzlR1/flk20QUAEr11YzmlnAPDEF5BhKq3NlEPj
         QVqza4XWaY/DaDqkVxPuWgVURnurQv59mQNdn5RAY+K8JcX9sEx+8G6aTETNerPwoXPV
         O1KUIZVNv3W+vWzSa04ddkRsj8ZFbPgg5TOeX46iMXe9NJiBPC+GyUOgAD/JmpUS0gY4
         sfTkyolpmDhAb2nkC7PAG4WEbldVIoN8RuhpzzUqr4j3xlxXHDcrg+3luIuPezy1iL2q
         jBPg==
X-Gm-Message-State: APuU4Z/xIgLiV8K3+D7pXZ9owiV5H1E8u9F/wZyZGo/d6UmDF8TL1RWS
	mzgjV3T3gsPjvD999HVEEGPzcjx95ZNnQVWBFn+sLcXTKQ9te57Ynn50Rl3Atb1kfCwgmtzuoI7
	vxcbERZj8bEb0xGOoL0KYqjwPov2lVFX+H0BGFTG33u1iuEU5SXrmMR9VOHJHkOnxDTicZpP3Yo
	+sjbs=
X-Gm-Gg: AYBFou2iV1jrC0fWJtJnjNMx6y8cMJglDD15FFzheD3bs+V3XV98aU/bcAI9GP5G8lu
	PS8gtBZ+ZBYVCMFM3ZfAe3gBCK9Bc2XH/HeaS27mqbHzU3loKcuD/4aqefjul1kK4dTtF/GFKlC
	Dba9VkjJqH7mkUA56Z0IZL+AXwd/LZKW5Rv1cW0+CDmnqYcwRq9uuALXn3Q8CJHF7TWzDq9jnuA
	ndQejKkC5zcL8ee0V9ojBFpwDZNvy833/Ia6cVciTMFJOFdrD+O3HpxFmkViW99OWU8s3AWg22M
	SE0L2JJPUAkM+50NXcr1gdv5m/2GSEIlDGAiMPysSHOxlOQyWm4pvwPQ/hOQk6JqEU1B6m/ueZo
	5fn4tnk6wqx/UvM0Fflt5Te8FMXN8gRZ4Q03YM2TuhUBOeyqOvDCUM3wVTR4E2ql9QdsLJ/g7LJ
	s=
X-Received: by 2002:a05:7022:2606:b0:183:bebb:e93b with SMTP id a92af1059eb24-1ac563025cfmr26606516c88.6.1793799173762;
        Wed, 04 Nov 2026 05:32:53 -0800 (PST)
X-Received: by 2002:a05:7022:2606:b0:183:bebb:e93b with SMTP id a92af1059eb24-1ac563025cfmr26606466c88.6.1793799172841;
        Wed, 04 Nov 2026 05:32:52 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm9525741c88.18.2026.11.04.05.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:32:52 -0800 (PST)
Message-ID: <8a682b86-3a23-4c82-8959-7ee066f960f6@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 19:02:48 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Add Glymur specific resources
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
 <sashiko-outbox-193144@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-193144@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb3407 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=PAWBQAtbQnHvqMwJI70A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX2/9ias5tSor0
 CbA8IaMy7cXl6g8tN9Rla6xojpSA2q4pZ5WNxqLsjDUMo3XBsBajfyID0SI8F0h0HQXHCfbnel8
 k0jKu5ZIkN+nG1OfyPV0hS/dVUr5yXCuHDIu9g9MQjOEJFa1TJNY/laXF9HvwNDRdOMIYf7SDac
 lqAt/s9zCux1l82oShlr0CZaM1D5fuhRoYmZXQIZMCmklO+ylH77L80w8wLWEenHBawUg0h8psx
 OI8VjqRQM7EK9PQT+9GGcl+yrAqvw16ApbwOkI2QrN/Lr72e3kdP0RsFPNQPz7DUXXcHttQDj2V
 pTckDnUyEd7SAedifCwqXHEwg1I+nGuwQNXw0rs6F0fKI2NI9StAJFSbvM8SWcA5KFpU1fldvmK
 AFNBDzN+dDvHyorH2mCbD08PBMebd+yYp3BzdUp4eYFKyNl0X9F7ioglRtnS0QUfYHklzHzxytA
 Xsy8mCglYy+cVWkyZtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MyBTYWx0ZWRfX7P9zNooV+VcK
 BjPiUVrfiX2PYM91J2m5QW8XVNdC7aqZzamfva2V53xV121KxJAqn9cL3CFqS5t1TLAxK3ts3aY
 Zmu7uxlb+aOu5RcsvxBEY9BxcBSMRp4=
X-Proofpoint-ORIG-GUID: ACgn2JCgEjgmsepxXW1agBvGnbC69G_N
X-Proofpoint-GUID: ACgn2JCgEjgmsepxXW1agBvGnbC69G_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040053



On 02-11-2026 14:28, sashiko-bot@kernel.org wrote:
>> +static const struct camss_resources glymur_resources = {
>> +	.version = CAMSS_X1E80100,
>> +	.pd_name = "top",
>> +	.tpg_res = tpg_res_x1e80100,
>> +	.csid_res = csid_res_x1e80100,
>> +	.vfe_res = vfe_res_x1e80100,
>> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
>> +	.icc_res = icc_res_x1e80100,
>> +	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
>> +	.csiphy_num = 5,
>> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
>> +	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
>> +	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>> +};
> [Severity: High]
> Does leaving csiphy_res as NULL while setting csiphy_num = 5 cause a NULL
> pointer dereference when probing qcom,glymur-camss?
> 
> In the standalone PHY path, camss_probe() -> camss_init_subdevices() calls
> msm_csiphy_subdev_init(camss, i) for each port, which indexes
> camss->res->csiphy_res and dereferences res->csiphy.id:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
> 	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
> 	...
> 	csiphy->camss = camss;
> 	csiphy->id = res->csiphy.id;
> 	csiphy->res = &res->csiphy;
> }
> 
> Even if msm_csiphy_subdev_init() failed early (for example with
> -EPROBE_DEFER from devm_phy_get_by_of_node()), or if no remote PHY
> endpoints are enabled and camss_detect_legacy_phy() leaves
> camss->legacy_phy as true, camss_init_subdevices() also dereferences
> res->csiphy_res[i].csiphy.id:
> 
> drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
> 		if (camss->legacy_phy)
> 			ret = msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
> 							    &res->csiphy_res[i],
> 							    res->csiphy_res[i].csiphy.id);
> 		else
> 			ret = msm_csiphy_subdev_init(camss, i);
> 		if (ret < 0) {
> 			dev_err(camss->dev, "csiphy %d init fail\n",
> 				res->csiphy_res[i].csiphy.id);
> 			return ret;
> 		}
> }
> 
> Furthermore, the standalone PHY subdev operations in
> drivers/media/platform/qcom/camss/camss-csiphy.c (via
> msm_csiphy_register_entity() -> csiphy_init_formats() ->
> csiphy_set_format() -> csiphy_try_format(), as well as
> csiphy_enum_mbus_code() and csiphy_stream_on()) unconditionally dereference
> csiphy->res->formats:
> 
> drivers/media/platform/qcom/camss/camss-csiphy.c:csiphy_stream_on() {
> 	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
> 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> }
> 
> Should glymur_resources provide a csiphy_res table (or should the CSIPHY
> init and format paths handle a NULL csiphy_res) so this doesn't crash at
> probe or runtime?

This is handled by the dependency called out in the cover letter:

Depends-on: https://lore.kernel.org/all/20261026224957.1115370-1-vz@kernel.org/

With that series applied, NULL csiphy_res is intentional for Glymur.

The standalone PHY path uses the DT port number as the CSIPHY id and
falls back to generic CSIPHY formats, so the NULL dereference should
not happen.
-- 
Regards,
Nihal Kumar Gupta

