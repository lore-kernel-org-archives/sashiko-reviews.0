Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F243BB126;
	Thu, 16 Jul 2026 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194608; cv=none; b=iu/1inX08YtqcSOh51oKqqNxV44idYvbD5oNZ/5bX17x6aVPFJ1/3TQ4apo1OW41O/HJp9Jv+GwXIEPc9LRm+e7K4B1fgZHzSlZSZdGHcoUBiKY/t2zmeUZi0LE1EKSFJYIVucQwa8+P/Uh9+l6ftctr5YYsKwPhKPneARHol50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194608; c=relaxed/simple;
	bh=Igdt2Jxy4NLY08/a/9QDgah/C4JtmJyrHGrbliKpUGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4daDX64lBTKUIk5xPu4dbv5ehBaB4sKBvgf8S7zwYrx/TNdqIYIBGj2i1jfZivnPbxKPf5xbu0xk3zAEweYlgos52fO05G+1xw4cZu9XLF14ExZAy7HR63YUe9hSMgYX6cV4le192dq2VzDLkgfetBVk1wwteuvvAPllcLwKig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9HgSbW6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9HgSbW6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DU8G1994824;
	Thu, 16 Jul 2026 09:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFUiJlIJSjO4iBGJ7Ma5WSZocrKRwGJx01ubuU6TOPI=; b=B9HgSbW6Fo5qhqs9
	wyhgb1qVyMTTa/0+ZLA6GG+cn1LHIUAsdvM8yKIPjtCga9pgODLRzil7zqsk7zeL
	+fI0kVwY0ED77Tlkh64+6wM+CTkDxO0lkkh272MJyuTBOS3C7EfqbuJv3MeyaOAR
	NbhF7SgjHZ91L1BqAfuNnylNMYGuu1yU/KgaWvBMkDc2A4murOtxvEl35m9KYOxF
	2riAi7kXDQoanUt75toUuGA30kyn7WN3iML6W5KYGSPwWRaaznRr0lKp3dJhflgu
	Jktt5fW7SeAURBUXNTGeA5h3MIJlahR8DerZYKNtXWwRJqkxXPh8NlKYHmpEKBa+
	w76POg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqk213-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:36:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66G9afbi014753;
	Thu, 16 Jul 2026 09:36:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fbewkfpsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:36:41 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66G9afi8014748;
	Thu, 16 Jul 2026 09:36:41 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66G9aed2014746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:36:41 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 107E7B36; Thu, 16 Jul 2026 15:06:40 +0530 (+0530)
Date: Thu, 16 Jul 2026 15:06:40 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v5 1/2] dt-bindings: power: reset: qcom-pon: Add new
 compatible PMM8654AU
Message-ID: <20260716093640.6girzdseyuwj62bj@hu-kotarake-hyd.qualcomm.com>
References: <20260713-b4-add_pwrkey_and_resin-v5-0-3bea476e1453@oss.qualcomm.com>
 <20260713-b4-add_pwrkey_and_resin-v5-1-3bea476e1453@oss.qualcomm.com>
 <20260713121328.339151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713121328.339151F000E9@smtp.kernel.org>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58a62c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IkX1Yui6ihke5z-Rmc4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX1RXmtQqbJ2I2
 ooQxj3B9psfldRegGLn6CrpN86+Xapr349kwrmj2Cs9RCAdsDvXBS8F8nGASrVth1bkdo4Lo2jr
 wVSNRe36QWQpSfPQEQbQcm/VBxehAGs=
X-Proofpoint-ORIG-GUID: PSWI8A1W_iUFPjrKNZgpE78uKmVOwZqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5OCBTYWx0ZWRfX4Oh3BQ9/HH1H
 3uJbXkn+B6HraIBHxlvC3tlAgBixAbPF6X1iO89UmSvuT9C2k/sdbfzM7b9F6i4hc19MKQ8NUwO
 x7xky5uhLqn115wo/4Jr7uSPcTVs1NDcaNvEEh+2Q0aknq+diufVG26BnCyd8Xkm04SHe/X2KV6
 AmOkyYL7tz3kZhsCfaXcUpLHCiSw/mfKoVgi9UiOkGtDuA4+63nkq+aY00xwcHO0M4PMs15A1mf
 zJ7OYWEAp3RholI9bf24inYMvo2mtTU8A7GCB9FJXd1gmi5EA1CK5cpDg6zLbHGt8POIM2AcwVV
 Wv3+2g6mptHt80qSSyxAkLcPDYi3wIVvGeJU9wGmajE2aH/DF+az3FsQXi9prXxeALM4E0WjCHX
 Z4A6ViL5lYIAaga+nLBtBFRsO2YUZE572q+AO3FOrss75rNQB/LYYpRBvkMaMzPy43v8ov6s41O
 YUKeYbkj36Bnko74q3Q==
X-Proofpoint-GUID: PSWI8A1W_iUFPjrKNZgpE78uKmVOwZqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160098

On Mon, Jul 13, 2026 at 12:13:27PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The schema incorrectly forbids `mode-*` properties for `pmk8350-pon` and its fallbacks, breaking reboot mode configuration.
> --
> 
> --- Patch [1]: [PATCH v5 1/2] dt-bindings: power: reset: qcom-pon: Add new compatible PMM8654AU ---
> commit c59d0da4493e27ba6b287b072dffcd65652a9310
> Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> 
> dt-bindings: power: reset: qcom-pon: Add new compatible PMM8654AU
> 
> This commit introduces the PMM8654AU compatible string as a fallback to the
> baseline PMK8350 PON implementation. It also updates the schema to enforce
> that both the hlos and pbs register address spaces are always present for
> the Gen3 PON peripherals.
> 
> > diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > index 979a377cb4ffd..09eea48c709e5 100644
> > --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > @@ -17,12 +17,16 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,pm8916-pon
> > -      - qcom,pm8941-pon
> > -      - qcom,pms405-pon
> > -      - qcom,pm8998-pon
> > -      - qcom,pmk8350-pon
> > +    oneOf:
> > +      - enum:
> > +          - qcom,pm8916-pon
> > +          - qcom,pm8941-pon
> > +          - qcom,pms405-pon
> > +          - qcom,pm8998-pon
> > +          - qcom,pmk8350-pon
> > +      - items:
> > +          - const: qcom,pmm8654au-pon
> > +          - const: qcom,pmk8350-pon
> 
> [Severity: High]
> This is a pre-existing issue, but does the current schema incorrectly forbid
> mode-* properties for pmk8350-pon and its fallbacks, breaking reboot mode
> configuration?
> 
> Because the Gen3 compatibles are missing from the earlier allOf if condition
> that matches pm8916-pon, pms405-pon, and pm8998-pon, they fall into the else
> branch:
> 
>     else:
>       patternProperties:
>         "^mode-.*$": false
> 
> Will this cause dtbs_check to spuriously reject valid mode-* properties for
> the newly added pmm8654au-pon PMIC?

This is a pre-existing issue and not introduced by this patch. The else
branch forbidding mode-* for Gen3 compatibles is intentional — Gen3
hardware uses SDAM for reboot reasons, not PON_SOFT_RB_SPARE, so mode-*
properties have no meaning there. qcom,pmm8654au-pon is also a Gen3
device and falls into the same else branch, so mode-* : false is correct
for it as well. dtbs_check rejecting them is expected behaviour. No
change needed here.

regards
Rakesh kota
