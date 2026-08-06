Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60313342532
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995540; cv=none; b=Z6Ya9jZCA5sZ2DN9fSayCBd6uP+u7keXEIcG6mu6VsQKN0AvnEDoRzrvxmT28LMZlQ30WaDbobkI/bOB2Yy1Vhj8zDT2UuAhEsDJR0M7uM5NDKC2KpYSLbaLB/tL/nFNFR3sO8LOF30kFXLLNbtDs7C6QTcA0V6/g9yqunq/7w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995540; c=relaxed/simple;
	bh=e+C4aZy523RIhd5n5NQNX/1B/86k5JmgV5gafuEnX/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMl8lkFwL/osMBf0m8op/i23PKJBwGLnqFz/OTVNwnMGZQ5CddMArbexIb/NIqdL7pIhPDAa7lsw5klVn/vSbacfzhUaQLsFywfQ4rAHm5z0RC0EYyeke/PGG683VWuIidZwSSLFk9wvvz4Plrum3Tk6eMfOohm5di0lCE1ymR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nf+jecq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imi1J6tG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nf+jecq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imi1J6tG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wV2T775061
	for <sashiko-reviews@lists.linux.dev>; Thu, 6 Aug 2026 05:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oeKHvlvTKqPpnFbSU3MA6x+vArE6ZN14UcQL+UlWc9Y=; b=nf+jecq1x4vefev7
	702Suf/gEnE3e3OA6u5GeSYAnRPQTYxMigqX7fFZvoNZxGqEym4/F0hUT2ZZmHq2
	c6Lc56rlP5T3hu2nuU12ssadeY/XdHCJks6fxI+2+rnzJQDs13xvivQxS5rGCF81
	38naJ/MEUQuZWtNENiPAnNP0DhPNdF44FowUR/LM64ijgBbS4xsRGF+Bzgb09uZA
	IRhVxmmND5g0Pqn7UjVT99n5NlyrPKIDmU5voptG2Aqsiexxim8HMiAUDwM0c18J
	476EoUEQmtOZ8lZiv/n9Taxc4vl9NNcSMLlqvBohaoqMkRWzyijdsMpyPxnZRoaW
	xEymkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8gc8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 05:52:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a97644aso19764651cf.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785995537; x=1786600337; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeKHvlvTKqPpnFbSU3MA6x+vArE6ZN14UcQL+UlWc9Y=;
        b=imi1J6tGXahAg+BEUP2wrnH5ub/oX8enSqBOgzYf5HLzt+sYdeDJxztHusWyEwUsBI
         EjuxgmnzS9+j9lbq1mIi4lifOWpavMjer7SDapRjsiEkyLeI3VsvoxR1Iq8YZF0twZsZ
         16vjzf8cy+anna4WVCXA4MHrAONL2VdtadtghS21OOcMKjZPIBYJNX4PZz4ddQypp8ju
         +pqx5r89jC8K9LIwwvL6VQMlF79jB+jljESEnubYpHwjraXVldNn0cSX5ophtpi+Y+Gs
         xLbyfBOK18q9dIwzItgp7krUXRfDtnJoIKCDLliNE6d44LkN4ZPy2EhX4BxUK0pvAh+F
         /5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785995537; x=1786600337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oeKHvlvTKqPpnFbSU3MA6x+vArE6ZN14UcQL+UlWc9Y=;
        b=l37ESwXVhhN+nO1mMPzgT5j6aOGdXj96N8Oj/YUTp0mLhAdRQpgQ5/DwmEbFHFzgfM
         eyVJBfGsdsT5HkRKcO2lhsJgJqlNAERS8lsfUyiI8o6ZypR18E9pJP2TFgSFruNQesUJ
         /R48xWKEpSXa4WFAA9b35XPj/KK2w5+bKNUrqwB6xLpQhHN608LY04CUaR0l5QWKjgT+
         bCDRsSt69YdCuWQPkkwvgBU2NJXTK3bGPOWuZu9Yirv4ViSTzGA/3WhE3Oy++ASsQ9VJ
         0AqWpKpJosECvndKV3OuVO8FUyWZvTMjzO3iww5FoAJ9fuQKTC2gWHJGjG0vdMvY/nXL
         1MmA==
X-Gm-Message-State: AOJu0Yw24vARKHn360TkSyDzrhIXb9UgPPnZ3AOiw2Mvfu0B1Wa2rjcK
	uuaf4d3gDBPxfLC89ASKqWa5391w2ZhF2wlaT3FtjoABYAfA7H6wi6BMEwkUoJI5WemxWlHr6lN
	C6LNGwO1BwdOmdmF23/LHKgFNsZFLOC4DLmzbxR/x23HFgQPR6yNmMlkexW99pxeuD+55d8JggX
	BXe+g=
X-Gm-Gg: AR+sD12odtnTXZQOz3qLDZFO3cm+VbWmCYu4G5XLHCoevRVJdDpuApYMIBnILSVTF0I
	mXQKCy/ffg3H84KepFBMEI/CcOPZOoLi76hGBbu+p+it1clZvX8X1U7ZBtaTWGO2K2WFYKllyFD
	yuYxPV/Wg2E4Odfju4tKoFPxaQWhCqGco0Rey+T44Fy9fWCkTqF0/A3V74Z4LJYuq7JUf1H98Pj
	MiD1B6eC1p01z4z5XedavVhaOmz1ep1L7EVTbCkl7nIsiu7XKnvIi0Yluw96WymuwYcKldoKfuz
	Mw96ke1EYLjq6pfKi/Ni9YgES9cwvcly1nuNz9iDvFT95YtcF4gbRROUj8NsVk41qim2tGJgilZ
	6hN3gJz1wZF4++pQQalR9CKIQM5sgySfNfHuCuFhDR1BrWHrXtpjfZ4jyJhnLQhY=
X-Received: by 2002:a05:622a:1dca:b0:52b:4e1f:940e with SMTP id d75a77b69052e-52ce5f446cbmr124017731cf.1.1785995537360;
        Wed, 05 Aug 2026 22:52:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1dca:b0:52b:4e1f:940e with SMTP id d75a77b69052e-52ce5f446cbmr124017441cf.1.1785995536839;
        Wed, 05 Aug 2026 22:52:16 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ff9d720sm44340536d6.4.2026.08.05.22.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:52:16 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:52:10 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM
 compatibles
Message-ID: <anQhCksBK0Aa7i8w@YUANJIEY2.ap.qualcomm.com>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-1-20463c43eae1@oss.qualcomm.com>
 <20260805103850.50EFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805103850.50EFC1F000E9@smtp.kernel.org>
X-Proofpoint-GUID: TZa2MvA0H-Lx8sPQ2dbGLlQLla9AeEFO
X-Proofpoint-ORIG-GUID: TZa2MvA0H-Lx8sPQ2dbGLlQLla9AeEFO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MiBTYWx0ZWRfX7tWY810XHdK6
 UG7dZuf+iB3KsvBLtRRnNxhyXv3jYKkXSn5cWa+zZ5jOnhMuZSU8BGKTlsx/aUZz8l3hOYPY5N3
 6vKjGv7PDgTK/Q7BF0EqOthC5hLhx0PoQVZkBuZ8hHS7HG4sfGSdv3Zyievt/57tuStTQ0HiWYg
 HocrwnXt9tMFv8Ggtp3kwTpeLfgWzdDYhUVdVXtiKQ00N7xAky3562uG8dUS8ahe2RMGpEsmFIZ
 ZagXGGvCLxD7oZ1KwIXDHkqpN4v0rSTgwCBBPuG9hFWQBQRkt56SJY+zJfMEFOzIO1/w7XG2Gp1
 208qm/XTnFGYa3tGzYAbOcPODkDcctiqlQSFetlJO4qdGUKG3n7nc+Be5RSLakyd4s9o85dOvmz
 A82PrdbuHfZjTh5WFcXnsCI19XiaBIO3CdpAUX/ReGTzJF7EBKaXkZS+RXJzNzqKMnBqqActhmL
 Vnx5wzbo62YPZ18aH3A==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a742112 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zW8xuOFVkWB4YR5bbQsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MiBTYWx0ZWRfX/gQmuvzBann3
 22hEHhk4758h5FeB0lvzQMxcba4IXQXM3+0zaa7DOB3rwWtwb3wL+I6i0UqO+EJ59ZxptcrqeZ/
 1bBL9LctEnFz1WVwL0etgoLgwF6SURg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060042

On Wed, Aug 05, 2026 at 10:38:49AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Renaming device tree compatible strings in the YAML schema without updating the corresponding device tree (.dts) files breaks schema validation and ABI.
> --
> 
> --- Patch [1]: [PATCH v3 1/4] dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles ---
> commit 86746ff462577b3f827d2ec7f0eb293389e741dc
> Author: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> dt-bindings: arm: qcom: fix PURWA/HAMOA IOT SOM compatibles
> 
> This commit updates the compatible strings for the Hamoa and Purwa IoT
> SOM platforms in the device tree bindings. It renames hamoa-iot-som to
> iq-x7181-evk-som and purwa-iot-som to iq-x5121-evk-som to match the
> official hardware documentation.
> 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index ff8a35df7862d..f244f547d5114 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -1220,7 +1220,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,hamoa-iot-evk
> > -          - const: qcom,hamoa-iot-som
> > +          - const: qcom,iq-x7181-evk-som
> 
> [Severity: Critical]
> Does replacing this compatible string break device tree schema validation for
> existing boards?
> 
> Since the corresponding device tree files still use the old compatible
> string, running make dtbs_check will report that qcom,hamoa-iot-som is
> undefined. For example, in arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts:
> 
> 	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
> 
> Also, does removing a deployed compatible string without retaining backwards
> compatibility break the device tree ABI for existing bootloaders?
> 
> >            - const: qcom,x1e80100
> >  
> >        - items:
> 
> [ ... ]
> 
> > @@ -1235,7 +1235,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,purwa-iot-evk
> > -          - const: qcom,purwa-iot-som
> > +          - const: qcom,iq-x5121-evk-som
> 
> [Severity: Critical]
> Will replacing this compatible string also break schema validation for the
> Purwa IoT EVK board?
> 
> Similar to the Hamoa board, arch/arm64/boot/dts/qcom/purwa-iot-evk.dts still
> uses the old string:
> 
> 	compatible = "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p42100";
> 
> >            - const: qcom,x1p42100

Patch 1 fix binding qcom.yaml compatible , and Patch 2 fix dts
compatible. So the issue does not occur when Patch 1 and Patch 2
are merged together.

Thanks,
Yuanjie

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com?part=1
