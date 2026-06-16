Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AF21DE8AE
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569897; cv=none; b=kwhl6Q6IthWL6dqSXpZ72liWZ+Y/7wlH6zoz3lgDTfuNN6krkFX7sK05/DQzJAP4ZPw5+9x30ovFloL3oT3pMwuXMYyFLlitjf2TMVT8dQ7KZAVQnLby22d8qCA8+RIFJrf00+eMonjmz2fDQ+8kdswkUCMaFbnogDLPYW7KNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569897; c=relaxed/simple;
	bh=MHwjTHvHldb8ebS0Ql9QpRAPb/oqg9bsQq0znVXqMUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c51hxmC2g+MppqmpSrZVNPQjH+eP/v1hJv9c5/FHju6/Ird3EiK6K736wQG57eHAioT7VN2ZGWlUasdduyJhBJhu3cipqCrrsRxV3clEEYY0vk7z2EGuCv/9ZYPDm/qmy49GSyrBlaWZkxqG3ONALXEbJOOoPZGYIFnTam2TDsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANKS3kF2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANfHoe38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANKS3kF2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANfHoe38"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0O7jv1592472
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeuYUVvks51Py3yMh13V2/P4mOBXDRgd4Fev52Wcl48=; b=ANKS3kF2hZKZtse+
	f6jUFa2eG73NobFaN9XjaoxGsp7wCcXzXrVIFD4GI6vjsvU3Lovr+ub32uxmbHly
	e+35JvTF/Ci4lveSCbzICDz8yFk5DOujUAqC9OXVEuAGRvMTWNkCCBE/bU8NkWio
	OHJMrrUYJ8KeXyiJo0aWpP3r443uc09pFfC3bjAlJOtIw+rr9uSxgkqyueuyp9RZ
	njl7/mCWjM2+gYJqJ3lsf4tsmVtWQiB9M48uIBzOetTnH8cCJXIdQUUp1E0tzlwd
	TYStRuLEVtveh5dWLGR4QkR3eD4RgKgDlL/0LetU0xiJOJr6F3k6BLPiCvXjx3wA
	fZ96rg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73qsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 00:31:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915f7bd027eso1043771485a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 17:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569893; x=1782174693; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeuYUVvks51Py3yMh13V2/P4mOBXDRgd4Fev52Wcl48=;
        b=ANfHoe38Ak6l8feWvN5P+HbSEa03+8f8ZYlPGXgdNOoaNDoISm+l0xMsXi5OGslp8v
         vBNf2b96eIdcj2tOzBO/bBeqNuTtSeI/SZumNr8FfHL31PzA1rcNscKNjXMADZ+rgKdP
         gy7lz3LVJLqRMTZ/cUvTz+973VEXd33c1tz44c69qlVkxvRowxZwh1bPCFvMyWMZnMHO
         OGyJij+M3UipBzQ6uY2qVwVw7u0Qfy0eIISkKRt/KKfgYxkTre0x4+fHNKujpvTBgpIZ
         nDbSuXwk/o6j+xtrEJFiapDbTnPZixhqfuurZLO+mgYidePgcWhamX9ac1znP6czW6Fm
         edAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569893; x=1782174693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QeuYUVvks51Py3yMh13V2/P4mOBXDRgd4Fev52Wcl48=;
        b=RhuafP3t1tNaiEnSoh1y01/feUi7ym++xi15aX6UXZD3lS0JAWlSebDPTQGekw0iJe
         NhUHrVaYIo/mH0WbGOPJexai43+0uPneuopMS8xSZvSAA2Abp7s0mzz+VY0//bVvHIYn
         IPRuSVazDIJ+SFq3pOBD9TAAc45YAhEfVd0ITwUyStN4uSEYlwi068hnh+lQbZTxA1MM
         yfXAxdh0r93RYx8t0+JrXKeicuTbFiKXLy1V87tfcspjdcHL3YPX+i8lCT8JliguTI4P
         YrjazVJqeqH8/hnaS2ExHnbb/2I+0ughkI7RhFVoOVWxKHFIaKB4KIgXD+0EtnCxzhH3
         PcXA==
X-Gm-Message-State: AOJu0Yz9jRvQB0oB1p5pxzjE+rz0QS7L9jKgb2aHDuoOR/gN0FtTHYkD
	Ed98O7WDTx9xOekF9gvTLfjFULObsULC6lkS/nOoPiu9hMb5q6qtEeecmo3yqBJCyeRu9HTOPnh
	bmW0MdDWNt30JJ7OsO7i3o/3tLR3fo0LiHJL5CHDV7PuZ97wmVD9ew1CCPkV+v9K8RvMuw+xZc7
	/itfM=
X-Gm-Gg: Acq92OGZxwfqSomnAGSgOFu0OJhQMqYo3AQuKMGdhiDzRyj1QRmd4J0UqGgZtuh6Nb1
	1iZAoLTbVdObrMLoM91SZfJ57XSoLZlO5b8/zE9kKykeEmbROjiqFdwinZXVG/RDyVeA+MR9MYd
	C5Ce/18sQVpdYeRHeVDuBBwdxLGXkObiYl8tPeqYlX+MeZIQJH4b09pN8K8WTt6ObFLV2LLTsmw
	uRa04dTQYMgngMQHIprhta+5E35naA/tcUK1F/cK0XSsQeQrMqvu+sERuexUkgC3hEbSxP+uPoF
	EvVU2Txg6aGs8UXeQLZFQGwuRQ+fb5p7AgA6uKp3/ZAiVyrK++OBGss/5UOqWE4nhsbM6LR/2US
	gnlPMq2v6l6nZLpR7iPnTRcuxiNbXcFQgkxyBg6/Hh7R1oaqyFWhJ8Mr26YJtkl2+nFqmx2Kss4
	2Y44gN7ZGwN8yMlH4H9MrFbo7PqjGZ0xxZjG0=
X-Received: by 2002:a05:620a:390c:b0:915:7e22:6f2e with SMTP id af79cd13be357-917f089a6a4mr2109734985a.24.1781569893339;
        Mon, 15 Jun 2026 17:31:33 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:915:7e22:6f2e with SMTP id af79cd13be357-917f089a6a4mr2109731085a.24.1781569892836;
        Mon, 15 Jun 2026 17:31:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a734csm3110455e87.40.2026.06.15.17.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:31:30 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:31:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
Message-ID: <zutpgilzb3v37yb4hc7gsgirsh62e3uuzo2hwzyabsgn4nxoag@nglxdirumfv3>
References: <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
 <20260616002607.0BABA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616002607.0BABA1F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: ahyLKlcCxxSSQXPg6BqG9wDsc6khkCGA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfX8/zlg3XAlNex
 lJ036kaqRiOS7qmji+xXvqWgoXjL6iaZHOzG8LA/hfRHiKGh8FHpRJl26VaK8a2ICACBV03+FiC
 CixdVTeBxXG+uYhMC3VJNI6T8fR60aY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMiBTYWx0ZWRfXzYTrEEmGPy6A
 eMxcRREpER8M11kKowW/oTz53Fngxi5bCTqWKbpcqqxJGLMEJuKIp+Ld1pShjwSDQJvki54p1bt
 lmobEkKaL3FKmfSJfD8XFiYNziJvnNyv3Zfcx7ldFJM4uw/UgS1Ok0D1NLlz+clIWHpzDxs21kD
 ++j+bGO634LSiM6cCzaZHQXJ4+QldLy7GbI6GlrcxRtj08Cv0Hm4pI0soB+zc8RZF2HI1q0WrCc
 SVC8opk7SexxqaYjDniNx4PYHqP/9jzIjTAPalix9gvaBWVxf0zL4klOzP63z+LjhFk+ff0MV8F
 PjbZ3+9CDdoFakgiqQcSNFQOOqhDFs7vw6bIhfSyh+sHcX2TqgSev2BiXtW10eZm+nSAuIe4RF3
 uvfgcOo1PIcHWAq5rZwKM8FASSXEDBWyR3W3nqG0TtPmPUtPA/qoyVSWcSwKUJj2XRqNe5q57LY
 RRuS19W48ma5exf85Kw==
X-Proofpoint-GUID: ahyLKlcCxxSSQXPg6BqG9wDsc6khkCGA
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a309966 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=j5hSHYduVrFwP0ah2ksA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160002

On Tue, Jun 16, 2026 at 12:26:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incomplete dual firmware refactoring leads to build breakage and NULL pointer dereference during device probe.
> --
> 
> commit 56abb89242d476eadcfa7c399ffc9ee1dfc1fca4
> Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> media: iris: add Gen2 firmware support on the Agatti platform
> 
> This patch extends the iris driver to support both HFI Gen1 and Gen2
> firmwares for the Agatti platform.
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > index 393256f39112b..d9de7dcb59e3a 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> 
> [ ... ]
> 
> > @@ -78,7 +84,8 @@ static struct platform_inst_caps platform_inst_cap_ar50lt = {
> >  };
> >  
> >  const struct iris_platform_data qcm2290_data = {
> > -	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_s6_desc,
> > +	.firmware_desc_gen1 = &iris_vpu_ar50lt_p1_gen1_desc,
> > +	.firmware_desc_gen2 = &iris_vpu_ar50lt_p1_gen2_s6_desc,
> >  	.vpu_ops = &iris_vpu_ar50lt_ops,
> 
> [Severity: High]
> Does struct iris_platform_data actually contain the firmware_desc_gen2 field?
> 
> It looks like this might cause a build failure if struct iris_platform_data
> hasn't been updated to include these specific gen1/gen2 fields.

Huh? It's listed as a dependency patch.

> 
> Additionally, does this introduce a NULL pointer dereference during device
> probe? If iris_probe() in drivers/media/platform/qcom/iris/iris_probe.c
> still unconditionally reads the legacy firmware_desc field:
> 
> iris_probe() {
>     ...
>     core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
>     core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>     ...
> }
> 
> Won't this dereference a NULL pointer since the legacy firmware_desc is left
> uninitialized for this platform? It seems a prerequisite patch refactoring
> struct iris_platform_data and the probe function might be missing from this
> series.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com?part=14

-- 
With best wishes
Dmitry
