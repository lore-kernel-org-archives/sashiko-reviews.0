Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A23D47BF;
	Thu,  2 Jul 2026 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978896; cv=none; b=A7H7xtKzMwXGEqDl5LcWtWA5E2HY+71PnX8E+LzYpr73EFk85GP62KjY8trxXGHfbcaBKrltAVmMYSBT9YwA8cU8OWdQswEKV6VFe9G85Be5Ld+ywFHtqTydwNOZtBHL5UdkGpGVX+diCWG+aA61imgeYeh699brMVNuru3TaC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978896; c=relaxed/simple;
	bh=80s9GqBed33BTqAr0bOpFD9qjRzOfdOb4OEY6M5BgaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imjw7EHlQjohmJXvqeNiI4CKx0jCw4tlsNf8W7B87m85i3a8aGIpHDWm9pJ8mm12z5+IuNE3UYh/FzhymEv3wg1epzAKfDZa5jbaQ+KZ/pfJ5+mgAZQbzTb/ddnzOFbem2fCWZtXLylqbkGfvByGUl2hfSHkkPLHXD0okLX2JC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThNwbo9Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThNwbo9Z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KFQ23067557;
	Thu, 2 Jul 2026 07:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OZS+zf+/UEerlnFGIPRniLxy
	9S9bycWifzRaL6XflGk=; b=ThNwbo9ZAKsu3NGd/WWfE2qGDUji4yrnnWSkLA/c
	H2GY475tkyCUBvsSz6oU49bnRD5du8HzMvnkvs8KzlYPI/DDBhK3KDzHuRBpKRQ0
	OIRv5rQxx1OEaWxGBx3Ig5Vo1kLaJrj+EBcaSQl94RjXWKcQyPKygsgQxm0f/mKi
	J0Zhj+3pM2TzBa+U7jKICTXvD6BquBLZH/vfx+4RqeTSrl+qYoGfpetnIzhXhzSt
	H0YZc/xhhMp3u+EDh7m8uDaZ0sMh7uhd5henZUtOTGlkS3nbtmX8CnEL3ZxsRioy
	kQtTgvSX2WEAIEp1ySCwdOK55e4qreCBMdyvAk2P/duD+g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510amg0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:54:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6627sh90012955;
	Thu, 2 Jul 2026 07:54:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kkp82w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:54:43 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6627shBs012947;
	Thu, 2 Jul 2026 07:54:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6627shdD012945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:54:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 6D200B2B; Thu,  2 Jul 2026 13:24:42 +0530 (+0530)
Date: Thu, 2 Jul 2026 13:24:42 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Message-ID: <20260702075442.tc4kbudjbfg75oom@hu-kotarake-hyd.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
 <20260701103435.D6DEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701103435.D6DEA1F000E9@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: z48GGNNx5UdkzEnGG7vzdSDsRTVTKe31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4MCBTYWx0ZWRfXzWQWrAbTrXP3
 qDJlaQaBfcJByAaJ+zbyFOwMVvfimyzkMeKlietXE9vi2F0AKiIu86YrQBReWP1MtUrhXptSs4A
 N3XHZsXZEsd2ORCaVSt+poWAxvF02vCtrpUz23F/TsLaaTRdYO4ZWPd5XnTjh1YLCUEmeh1xSEy
 6sqPTf5ZkAeLM0uPHTUQreeByl+WAe0cqTp6uzVjnbNyaiQ5hXU3ouqHHgBqOG+iNosPAXIEBfz
 SYULhhlJzG4fvcoFNo9UUJlK5qkRBo4XrmjS5st1gyf9gqalBoZz6v8VaJTX++cKL0CA1MKXVcn
 +bDZCC8Yqt+kIMVc7PO8Oa1E1AKZmmyS9O8Qygl5Ey3v1r5U9hNZNs8BTNLB+3oL4v52NS++YIY
 qy3uT7XHHSrEICyy/EsSBttcebihOw38oDuHT4KpYUmozRMhDJDOHdxeSQzhCp0rxOphn/tSqG9
 3ytC711ZFPlGeOhc96w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4MCBTYWx0ZWRfXxxpWOyUa3nq+
 33W9v/jerKi53weAlOT5h3PbcsAFBeQiS6935UwXeOinTyYT4Kd+0AmNuOcMldfdYBzo/GuvlnB
 wgmiviSAkmmpN60H6wrXGFjhT3g/cxY=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a461947 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IoUS9DNabq0DWTRCKIYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: z48GGNNx5UdkzEnGG7vzdSDsRTVTKe31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020080

On Wed, Jul 01, 2026 at 10:34:35AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The macro `PM4125_VBOOST_CFG` is defined twice with conflicting values (`0x52` and `0x56`), causing the voltage selector to write to the wrong register and corrupt the OTG configuration.
> --
> 
> commit 3778477cc88a05791ed34dc272e50cbdb4893643
> Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> 
> regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
> 
> The PM4125 PMIC uses a different register layout for USB VBUS control
> compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> a current-limit selector. Introduce per-compatible regulator descriptor
> data to accommodate these differences.
> 
> > diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> > index cd94ed67621fe..40e7e5589d5b4 100644
> > --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> > +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> > @@ -20,10 +20,35 @@
> >  #define OTG_CFG				0x53
> >  #define OTG_EN_SRC_CFG			BIT(1)
> >  
> > +#define PM4125_VBOOST_EN		0x50
> > +#define PM4125_VBOOST_CFG		0x52
> > +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> > +#define PM4125_VBOOST_CFG		0x56
> 
> [Severity: High]
> Will this redefine PM4125_VBOOST_CFG to 0x56 and silently override the
> intended 0x52 offset?
> 
> When pm4125_data.vsel_reg is assigned PM4125_VBOOST_CFG, it appears the
> regulator core will write to 0x56 instead of the 0x52 VBOOST selector
> register.
> 
> Should the 0x56 definition be named PM4125_OTG_CFG instead?
>
Yes, you're correct, I will fix in the next patch by splitting the
defines:

#define PM4125_VBOOST_OTG_CFG   0x50
#define PM4125_VBOOST_SEL       0x52
#define PM4125_VBOOST_CFG_MASK  GENMASK(1, 0)
#define PM4125_VBOOST_CFG       0x56

regards
Rakesh Kota
