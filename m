Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9D03DCD96
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556619; cv=none; b=D7xzi4AS2OZnDRREREzS0OUNp9mGvA3hXXejGi52GtaKi479ZbsQxmorEZfMtIWcXCpGkPjSsUCrgBRmEjAYLiqesp0oGYXqgTOdEUerVSVbV1PZU3hABcj58+q4dYMwV8W1GgzoKleIFHN/UKTPaAb5at1F1PVjoEok7HUYw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556619; c=relaxed/simple;
	bh=eeifG+KCUF+ggQSAa4sX4MACvBu36hwWPw6LlvuYs/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2DWBTJT+edIfz8WYsLrY4ZR+INlfmGQKfIAnznSYcFW7PMNoROsruEyz1NV2X7/TVa99TtYAiEycP2JUCS1NTZcfPWrb8XA/SBNMZV9rB9/fjHCGLRqgKkaFycLeq4UiSqsQv2tm6RjZufI2FTnlYhNYd42wMuWSbHGek+AiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlMPY0Tt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPklf7CD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlMPY0Tt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPklf7CD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqgPD2702126
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zlw37I77UEcu7PgkZBonU+7U
	vpDEzNU8P95fsirsjcY=; b=DlMPY0TtAh3MqzDXJewBmdT4nyVrYFggSvpVO2O7
	rZfeWlNtFd8Mo6/QHmpjJ/HmhmIjXZKf2FpKWk9DctBoGsQ/PLnU1XWVy5fe3HVU
	EKB+6RValYz9BudzSOGv5QZHkx90Um/Q9+HiXFfgbutvNZ6WaXN7HfRWI1qshVr+
	X3pxefnGaxVJQvDzr+N4af3Jwv9/wpJl0Wj5cKtsZcUrrdgk7TuVy+hpxTmVmCnu
	TCFCYbE1bIrivJ0Ga2ps5gJcAk9RYVPKrjguGZiiPfxqU8Bp5j6Izi9QmoA7hsv5
	yd3L4CYZ0flFSoKWC51oAP9mafWq0kUFJIFqDR+OeMgVsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0c1u4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:10:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso141267221cf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556616; x=1785161416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zlw37I77UEcu7PgkZBonU+7UvpDEzNU8P95fsirsjcY=;
        b=NPklf7CD+zoNB3FOL3sDefSzbZF0ksh4XZiTHCZ4geCYGK8bQz2xdnU0wRcaI5PJGG
         h9K4TLl133rrVrRKXZZl6cE3K+7glkcnfE4FMkPWnZu4lPCC5vcG7HTbGXnnWosVwkSD
         0wACGD8Jh5uvrHyhN/3dr2P0fqQB1MuYfTSVGKgXI2xqJ7EYKa6JbjeeGQW7fvvxN8sH
         9qXD9UOC87RpIQ8BgEa576Bux0ZlYaia1q2n3A/53dOnL7/Tv4U8xaFbv4IR878Am0aT
         9kLOAfslLkK7gFcS7BnifAAWSu3oMxMOuxqy/5pRoMN3UCaHOPN4cUp48Ef+ePMq8ass
         1DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556616; x=1785161416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlw37I77UEcu7PgkZBonU+7UvpDEzNU8P95fsirsjcY=;
        b=mZ3B8F8xi9oKxtfqQPY4Q845WWrgzh60VxxVwPFJR6t3VyB0z6h3SaDQ4hua6MP8uh
         p+lIV9s4qSMlPvHY/dtdb6rZO1HUZ+lK4s7qIYx32TU2tLBSYT/l+/gH4R/LGT2OJrbl
         IE08Pi56iZ4aZ6CsLyLPGInW2aLCIU+G41f1rGAOvT6gmQe5/fkRD+crz6RGSLQQ4aa2
         85jBe2/9qCSBZOdY95C9E7+uChw2k7Urs0XP+/h/gxXXW3VcrMAZqlIelgDDAcK8FyYZ
         npaCcNd62j0HDkf95g2YBWGJ4Zko+xw47TUIrbKQJyKNDZq/MrNXwrOqFlTxwZV6TrhP
         Rb8A==
X-Gm-Message-State: AOJu0YyooP7bATjLmRZXhkoIa/nc8q37o+6U1wzdrB98TicpWuiWQkn7
	ngbqN36cVtJiPq6cFK9ivPaYU4TNV59vqbY8M/FtVvQ5tmWMpc/eivIOyFuqHO88pQTnhvEbdJ6
	8z0gYhHWjf4TbOsbj2SFywis/j7gvLnd84wD1gtEmNNCjM9+nerke1MT7jVdLqH3e8dec/MQ=
X-Gm-Gg: AfdE7cmEGXgnsRQ1K6bFnaTobK3OLyvwRLIXJbWVujmHTXn5++m5ziRNSXgIgD3dRdD
	O+eO+81BJFcemiTxmI9hFtho3coPraN0ejxx+/jEsVRH8yy/Xm6OTTkVTj+Jfj+xxP4+w/JsjVj
	Z4D8e07/NFrFraOONvnw8SeK0uImUQ4wBEHf+CNIrCfjt/tVrKqbhmkznUeyQuEW3+szhEmRZ6+
	4V7gkA2GEaZACEPrPcBZagiNBRmHCH9OGL4qz3Ml5S6pLmuKXSBN0TBP3hABcxc1qyMr0Q9qIdn
	iiWE+S2txIcEpm2N7jr/P/x4lx0LmZPDPfHSlyDIVUIgnoaTSLuxgVMMTdbxQvycwhVvVMBMvbP
	D1UjFOfg3PvZ1gMN0aVx5gprWyCd+DFuXatfr0vc2Yw/neb4HibHfsGx7fyuCDIciFGUGgBAszl
	N4+swyCNdO6lcU+g==
X-Received: by 2002:a05:622a:5cd:b0:51c:1291:911c with SMTP id d75a77b69052e-5213d2b728dmr130012301cf.14.1784556615727;
        Mon, 20 Jul 2026 07:10:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5cd:b0:51c:1291:911c with SMTP id d75a77b69052e-5213d2b728dmr130011791cf.14.1784556615296;
        Mon, 20 Jul 2026 07:10:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e298d5sm2320723e87.84.2026.07.20.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:10:13 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:10:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: sashiko-reviews@lists.linux.dev, neil.armstrong@linaro.org,
        olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org
Subject: Re: [PATCH v4 2/8] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
Message-ID: <al4sQ1kNriKH7hHL@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-2-ce5e1d456cda@collabora.com>
 <20260611235702.0E9691F000E9@smtp.kernel.org>
 <90ac7bbc-977b-432a-9f17-b7280e19d819@collabora.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ac7bbc-977b-432a-9f17-b7280e19d819@collabora.com>
X-Authority-Analysis: v=2.4 cv=HeYkiCE8 c=1 sm=1 tr=0 ts=6a5e2c48 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=SANp81FrUiQe7WWXlqYA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: j37h_ZZ041QbibJDgN5FZIiGCqu_F5M_
X-Proofpoint-ORIG-GUID: j37h_ZZ041QbibJDgN5FZIiGCqu_F5M_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1NyBTYWx0ZWRfX7QZkABM4tzyJ
 0hGo2sqbE/MEVD4aQKf81ySX7a10F1I6H9SKjmsLfd2pgLvkjWdtr/Ia8UK/soNHoqUOt0mN/9O
 5W3qpi+1g4Qjt0V+zaqO/HXLdYfuHKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1NyBTYWx0ZWRfXxe4tugRsbfuM
 lgklfgIS2M6LTbE81i1VGp1TzXgYB9vLYYTRsEovhG+xfutlxG1W7koVU0fmmHlzIOayZ28Ls5x
 vtURrw0uRqPzINKosD2HCX8qGDKuMVcD6IOBWu/ePkF1suzBLibrrPXVqgwOp9BFfcRTq9S7x4T
 YTEvu9I5kJ64FapuXezzPft38jIYmUGZOKWuKzPVxFe8+tpvvw+XgU9XWZbpxwffM6YBp0Na4iJ
 cWCU8Q1e4Sd+KAAgET9frJXLpSvTlDlcC4bvIE8PuESdV0ExDmlGRRoVxHFw77VcERi7kH11Z4b
 De/jM3kP04wzunnkflB6YcrwTZTq8K5Q7F/JqgScPd+TS2m4SZan/QW5WYtZOQh1m8HVdpAZ1Y5
 kk/XfnDWBnZ/R4OY06qzfpq9brBvoGJXAoR80hWy+cv/c3rc4/26llkDj/tFFcg3zpNW6JCumOi
 W2zsdzOhXJ7b46RR1YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200157

On Fri, Jun 12, 2026 at 03:18:52AM +0300, Cristian Ciocaltea wrote:
> On 6/12/26 2:57 AM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > 
> > Pre-existing issues:
> > - [High] Potential integer underflow in `fout` calculation when hardware state is misconfigured, leading to a massive bogus clock rate that could hang downstream components.
> > --
> 
> If the hardware reached such a damaged state, the kernel is likely already encountering more serious issues.
> 
> Regardless, I will address this in the "FRL TxFFE level control" series, which is currently blocked by this one, to avoid any further delays.
> 

With the overflow handled:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
