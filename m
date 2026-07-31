Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EB63EC82C
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500959; cv=none; b=swGrMcnxgvEGs/yYXPGUJbAv8edj6oD2FH/oAtHdYt/ncKEpVwQagqMVSMMLpFgrrKR3XUwwi8XxZ47fYyOiB/LetMLLl84WaEHVun8ol8NgARvI1E8XnFnLdIhdl9z26ZrconJ0xnP0GQZahSjHRAb/xuR/2dX7uO/2vwabl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500959; c=relaxed/simple;
	bh=H02tK31YCq04BwEgpnWejUmgmdJHg8vGTKDpAd8w2Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUebWVGS0cfsIh9U4Su++U4fINJ2O1+CTHr7iGUcOaHu6hmOzb03D+a9L6DPXwYTEepJtIpwOURl7JKkeRT7x9F6Np63x6xOY7iyj2lvEskK41/Ru8u/V2okwmpCowzwMYTgumDBRzPwwgAwbho7eJIdVEkRMEo7Y7ilW8blM1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gxb7ec/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLw1tp35; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gxb7ec/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLw1tp35"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBmAg13905273
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 12:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YDsorips3PTPKViSLkf1nm9sjWClIKsdYAqhnCzxWg=; b=Gxb7ec/h4Uyjsvjx
	I6OQWmH9KWph5RJnTD3bqLqUYGt+04vzDR2tQ0oY2jHG2pQog59Ikz9us27lsNwC
	0VRiV9vwaijcWX/BkylMJci3f3jYQ5BSkzZeRS7MB110iQewFJlXerqU6PjHTCtz
	F1LlUQNHneCF5lUu5cWgBbRiYgJ1h7psCLJUETayx2iui24Aoi57fkPMVoErrHTm
	EArAeDH69xEqcOQ6MvrK+lgbMI1kWaElwVssa8Yrh6fCVcJSccRPpXq+uBdH4KT0
	6ZkutfBmw7PVay7+6CvE+m/wRuuTxGNok1PkBGAOBrCyOVtM46kKeJZI9p2MMd2v
	6zpCyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dg4vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 12:29:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so8523201cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785500957; x=1786105757; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YDsorips3PTPKViSLkf1nm9sjWClIKsdYAqhnCzxWg=;
        b=VLw1tp35mRadVH9LveBxrHRJbxm8z/wrEr0r/MjlQsFcRzYx354HfWzC8iyX6odS9l
         AM4HyuQ80XHic/IldXxJSyc2vr5DgADuDzXXUxwMlub13Umy3HBj7x0u5l0KStdQB8ag
         q4TvXTmsp6BW4DML5UmByUVAaBKbTfGKl8n72h1Sz/XY/Wqup2Vj3QDCY+huDc5VWy4D
         PfZO24kYkY0G0m43yVJRTE+bJXWZjXkVj91qmAroQWLARbHc9Yp+Zk5tgTU6Pm2euEP7
         Z0j2MI4X/2Hc0Use9VPDEH0ChgQ8jmwTg0MGGuUL8Iz1DD8peuEd4xlGqyDwky2MnsfZ
         sN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785500957; x=1786105757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+YDsorips3PTPKViSLkf1nm9sjWClIKsdYAqhnCzxWg=;
        b=hO6l/iwFnP8YVYgpT/K2cLSnfZ0SH/Si/URYONmqEvHlIhgk+v8dBaRfdia/tI7OkI
         Kx9AkRE+jLEOQBSLRklruZ7GKfEgaDhIyrE/lLGuQ2dCOYpjP9SPanz9vIxpLI3IgPOb
         YLmIsC4XBUufEnLchZjMwe9HU56qvTbn3iyhmCtsdnQosWTjfnbrkmjz2eLh13xoxAX3
         42Hx8J3TpmgJbJ00V35P1mOZoiIwnc7M0qeoIoi/9pWtQ9rPPoK16iYvUfmOLNygDNkR
         HoDz1/npFuZ9ffVoYG9BGD2nOnQMKUhPFzMWMlkRFieNpsZoi5D0HryqbOmhKfwff94H
         ucHA==
X-Gm-Message-State: AOJu0YyioCMVFnPu2UpzLSiHRH7zU7Hc7XF5iJj6Z74wFgyNnsbXZpIm
	9WHC6pCExEq16Q1DUdSpYhZ+vVqfvlr3zTSrn71rgaZuf7Yq5BgMb3gEICGiXCLH/K4IW4JA2Cm
	xHUKWysBuB5f/v4lZMVd8CHjmEbw90iGwDSLDtCpVjLGddA6BNw18okP5d5Nu/5ktvr3OPKr92Y
	LSMRY=
X-Gm-Gg: AR+sD12AE/F66RzY8sgMC4wbBEBx6P2db73SLRM8FaZs+uN1rNjY12Fdj/u9STxd5ph
	VfizD3CvEQoKWZLuGPD2r4VxTQeSGNV8otFVgwSNma45Q3VPRvZzXsT6bp/ZYaqy3/LhwJ5eCv8
	8o4OBqiOSgYveG6F9qvIcfOIPBnZo+m3PMz7M4oNqvBzkymENcmoh8pSB4eJSw1IjOUE1omAkhf
	2eQjpYMhH3M8/u0mrnnvChMrKgGUjqf/mHJ87DOepaTE+KOOY88/vxbrRhdd58+c2Hm/0QpM9kY
	t8WtzTQlL0ReK6l46eEKxHF3Sl9NwljIBGJCUrFXdWihqYKepDRnBstZuEP1PpVEgyQLg0OL2GO
	4DPPwXC5WgtiHSnvO5wUc//T1rPItLCOwAQBSmdpWesBC9jSvSwD94z3THj/i/Lp26EuKgD86DR
	n4yKXTr6jDdl5Pdg==
X-Received: by 2002:a05:622a:4cc4:b0:528:3882:3866 with SMTP id d75a77b69052e-52b4aed0cc2mr27800191cf.15.1785500956532;
        Fri, 31 Jul 2026 05:29:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc4:b0:528:3882:3866 with SMTP id d75a77b69052e-52b4aed0cc2mr27799791cf.15.1785500956040;
        Fri, 31 Jul 2026 05:29:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cb44bsm273123e87.23.2026.07.31.05.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:29:14 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
Message-ID: <zyxl3lww2j7e6iw2n4dggczd3ma5m7mfpsgmubftnibkt6s4fm@m3xepjruqt72>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715142224.5FA721F00A3A@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: yNeXN3qWMtX09kOrXITP9AgeBfj3dEK2
X-Proofpoint-GUID: yNeXN3qWMtX09kOrXITP9AgeBfj3dEK2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfXyYVXQ0hprWra
 R6RJBVOUvYGF5UZu2mkMLbxaZ5ZTONTGx9REzNls5sxr1l4pydl8uTvyPnOkEwUAU7S9axz9T4Z
 Umyq3aiZKbboI88npQU68ikz77gxvGIS+bFBL6yOcCL6sveuMrPuQjqYbpBV/6pgj4sd1Z7jtYx
 /3PfPoT7IVQH6wcjMMWUG6qXCghVqAELiPfXv5XC/5t/0rRHE3N7n545m9kLYz7k69Eah31fMqy
 WhvyyNl80T8nx8ga79y8qY/IEpu82cpb3WTIVurnhl4KNq6Oubt4+wxnSz4uNOkQcZaEpcVhBlW
 jnx76kWA2+lZG2sqMZex9gyREfg9rh5OG/L764QJWsw1g+LqdBNeEu+OxDBbM6ZbqZEugrtsGMo
 /i4NSJvv/+9Zekovb43kY/2JV+D22ZcXdDA7u2TdpP1g9+wGyifgXkPUdi/X1zPxwWq8d/8TKSG
 TBPaPYsragrmJSfc7Pg==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6c951d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Hx64Y_J6jGrKGZATseoA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfX1+HtFToxjNkC
 QqxIJiq0lheZt5Q/1DF0aa3N6NOdhLnDDuADMOOKKnBHfQ2oJwgm/75YWy5ltz873he1um73awl
 abnAss0dIglRJbLjhaGYZtVwGSiXGno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310095

On Wed, Jul 15, 2026 at 02:22:23PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
> --
> 
> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
> 
> This commit adds the device tree binding for the Qualcomm Glymur Iris video
> codec. It introduces a new dual-core architecture requiring additional
> power domains and clocks, and updates the maxItems limits in the common
> venus schema to accommodate these changes.
> 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> > @@ -0,0 +1,255 @@
> [ ... ]
> > +  interconnect-names:
> > +    items:
> > +      - const: cpu-cfg
> > +      - const: video-mem
> > +
> > +  '#address-cells':
> > +    const: 2
> > +
> > +  '#size-cells':
> > +    const: 2
> 
> [Severity: Low]
> Are these properties necessary here? The schema strictly enforces const: 2
> for #address-cells and #size-cells at the root node, but none of the child
> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
> does not define a ranges property. 
> 
> Will this cause the DeviceTree compiler (dtc) to emit an 
> avoid_unnecessary_addr_size warning when compiling device trees using this
> node?

Indeed, it does (with W=1)

arch/arm64/boot/dts/qcom/glymur.dtsi:5365.29-5482.5: Warning
(avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary
#address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
or "ranges" property


> 
> > +
> > +  non-pixel:
> > +    type: object
> [ ... ]
> > +        resets = <&gcc_video_axi0c_clk_ares>,
> > +                 <&gcc_video_axi0_clk_ares>,
> > +                 <&videocc_mvs0c_freerun_clk_ares>,
> > +                 <&videocc_mvs0_freerun_clk_ares>,
> > +                 <&gcc_video_axi1_clk_ares>,
> > +                 <&videocc_mvs1_freerun_clk_ares>;
> > +        reset-names = "core_bus",
> > +                      "vcodec0_bus",
> > +                      "core",
> > +                      "vcodec0_core",
> > +                      "vcodec1_bus",
> > +                      "vcodec1_core";
> > +
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> 
> [Severity: Low]
> Does the example need #address-cells and #size-cells? It demonstrates their
> use without any child nodes containing reg properties, which directly causes a
> dtc warning during dt_binding_check validation.
> 
> > +
> > +        non-pixel {
> > +            iommus = <&apps_smmu 0x1940 0x0000>,
> > +                     <&apps_smmu 0x1944 0x0000>,
> > +                     <&apps_smmu 0x19e0 0x0000>;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com?part=1

-- 
With best wishes
Dmitry
