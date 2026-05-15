Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5E42DB7B8
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847295; cv=none; b=bhicN+qbAHXY/kkLTg1D3Ja5ScmlWIiaULxvRJQnV8BbUgULRZgo19VvN1MV7PzVMgfEQW7G2h6YZurTF9+s1UGo9HsohCfYGN2pMfH+ZZ83LKwWoUmgTkYflbrdqU0JRvjZxWsmfEJaPUYS8AVuQTV9rmSCofdw6bCiQOYkZzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847295; c=relaxed/simple;
	bh=hgNv+ptqA/p+YpoA+ShbxU2tfcJNNiY/B0OGGogvVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbMJUuXQ070X/YShSchhbYhTvm07eytZ37pFWDxdThsu2fphoqXteUL8/UgKZs0p03o6wjLj2nVWB/MdTrKi4Mu6tZYqpqLWmrFzq5z+M9o8FgQ7ACBS2GoS94MH5b2PhjlgC1AbPA51vH9ywbQn/gtMlJyqB5EEeMx7vIZn5kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0AgFTG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZ1CpElA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0AgFTG0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZ1CpElA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBej8h3795744
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FEsFbDmLghK84t+EIxt+lyDAO45eJmqJ7geiYDij2c=; b=O0AgFTG0qiMZfvlv
	vHj2Q5uToQc7FGwk6jcxttBotNo83Eg1sBTBB9zUjhn55UhIVwzFQ5MHjQOtaG8/
	xFDqky9SophdU/xq4UlSwB56S3ZMjp3y/o3sHWDOsjYklllpNDm8afORalTSwB07
	qPUJhn81Skuj7pDmWFGfkFDd264oUahiff92uuogPBDMvkuiLrdaOABVU1Vjb0T4
	DHLtA9w6kpYMTOp0tWlvFxw4SxbWtZXmpgaKBddDogEHZbGgqDoGtBJYefsdW8xC
	v3rv4cY/z7uFZNyBr/gSJxQn9fxr4Dj7efDcrt6fL7DOTjlK9QfuSafTJRlBYrTW
	D9n5bQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1su4gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 12:14:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-631a49033bbso3492787137.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 05:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847292; x=1779452092; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7FEsFbDmLghK84t+EIxt+lyDAO45eJmqJ7geiYDij2c=;
        b=dZ1CpElAmoXZB7jNEeUyLlr8vplpRlI7mTO4WY/MYwCm7oTlkPMgsOtjBMXDODBQqj
         UrRdVA/M8mpM90jvL8qxrewHuma7tS6DZXMm5VfYGnYgJGRTDziDt2Dp/leNDxm0i1ki
         xSy4gtf0xICm0eAD8jae1fWG8+S07VX3GJbpQoy+gwjtDgLq4tlxTmA69/5ObZALj8NV
         MRvl0aZnZ6+niZBWAw1gPRTNAUa0Z3pfEc6s9T6yvdHEBf9INB4An41IZV+Km06HUHA5
         gFWqH9iAxlb5xYgie66fQq+ahMbY8Pf4TQnHxmaBh0uilK00YCP+rAE3+w4xqJ0wXSL9
         qhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847292; x=1779452092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FEsFbDmLghK84t+EIxt+lyDAO45eJmqJ7geiYDij2c=;
        b=TIS/lyCBF0ayFTCGmcEOzWQMwW1BFhtcZMvKN2Zb85U6XKNGn1AKuIrvUB+IeTaHys
         OFPdm0dMxWRXtcmSMqg7PVtYrqLKvRc4EveSLAA6InookNYZGD4/MTTfShZxgAdE2vHK
         r8OLH3GnvaG48lhxEcCwckK5N2bGpO52fj/Da9ancZWge3qUr9O4tPEdswUgWOSoYkgh
         ZSBGtoHEbgr9Hw4Ihzl3LYuObhyanS8QgMph3EioV9QU0oZrDnaM7Urg6xTb2T893R0G
         1d72vrKNJ8X+jhs5P3FdUAqh9Y/juqeOh1UQCvRdgPZzc2e0w848zpU4Kdw7WKyF013e
         HS0Q==
X-Gm-Message-State: AOJu0YySYu909TnvrM99b2v9Jw16OTIyJs0SyKTw7NnnsV2lgKjZNdaz
	SKA5M1RKl+G/g8dy9vDZabpnbCLN/VHnxZiNNeM1E6Lg2g9v1D65kfQA8v8oQ22p6NGiT/gFU8F
	ggIdGDn/M/6AM7tdD6uZh5gaRSF3ji88VUfr7YoG0Vifgsl39MvaDyGVag4P2eAT78ZqjKjbbFb
	+AkOg=
X-Gm-Gg: Acq92OEkvrAEpgrKkSYvxFhVK/g+ml7UzhMf3a1lKB0WoXwGpnbehnGVUHVlc6Ah2ji
	qqujyLAMR65CTkCZZnxgOQLDLj+eybckCYTfwObrHKH/iog/g+0l10N4WthYKjp61ShX0Q7zEXV
	azzmyNoij6ERl4WpP/d9QgmbuRWmKPcgcLM6Q/ngES25cn899y7ZPesbFiGdHhbjq0zKDN65yAc
	toRlxGSymoG8YyWBWKZh4Mc4+0827PRxlVpFuChMA/mMXMSUPJ23Ahu+JTCo54FAS8AAXrM7F8e
	68AvmMXamn+VjS6nr8yn0o/OQlK3Wo96j3dGscMoK1fpKeom6mhWRG8epYjMo3dZX471TKCmN91
	cPyyEkYIfinQi+XRH5F63Yv2udmDvI98YH13zQf1e6OuaXvRtjwZua6+iSC48JuM0KbzV3j7CIs
	c1qttLqRYbx/xSSLb661gAmQ2eBriQc9EgRbldEDCCYahkqA==
X-Received: by 2002:a05:6102:5e8e:b0:631:44bc:c0fd with SMTP id ada2fe7eead31-63a3d322d11mr1670453137.8.1778847292043;
        Fri, 15 May 2026 05:14:52 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8e:b0:631:44bc:c0fd with SMTP id ada2fe7eead31-63a3d322d11mr1670416137.8.1778847291607;
        Fri, 15 May 2026 05:14:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd86dsm1278246e87.69.2026.05.15.05.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:14:49 -0700 (PDT)
Date: Fri, 15 May 2026 15:14:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Message-ID: <mecxgb7kbzcwr37pqc7zuqm5kkzgv455qpitrnntmk2lz6s7rp@57hnu4rjx7r7>
References: <20260515-iris-sc8280xp-v7-3-2e21f6db1897@oss.qualcomm.com>
 <20260515114207.B877AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515114207.B877AC2BCB0@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX68L9i2t+bqbh
 9ad8PGi9cnO24YuhNxQn++0rkgH+X2V1EPlb9sbp4C1OZawYvHrzo4WihFfPTNgQUZWpzlfkEJx
 2a6Py1NcunBtfB3k2vsagGbqgMRIhEVwKqgXDA/GQ0nGAmGsl5MG/x2bDu8xYj8LnGLrdILmD5z
 ArteKBw4E9lDcdxbqbF4q6cUCKH+kUPq7z85bQW4FVP4jOpQzKpi8isI/aDE4LnU4n7gWI4Q1RI
 u/eUVwVQgoCrOFlu/gLiQzfLTqJKLa4IkNXokftRdUO1dJonOHx19s9YZYIUieBqjkTZEulVGp7
 bRauaVGrB/7ON7DtFYiZAKB2Ibgf+e+Q17zKeH8/tADbxpR25xz++l1AzdIqNsC4K06SK6yrAOs
 8OrhR0lWyP80JSpwL9vkV1X90KiTL3nT2Ogh7YJ3eFgIY26t5w03R3nsCs/E7knM33RNnuY9m0Y
 /Ez9DswYjJxVz4AbOaQ==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a070e3c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zP1zt5cwujKoDgLrck0A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=gYDTvv6II1OnSo0itH1n:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: JMutR8ilzzOUc5X42jnP9nEIO7dAc0I0
X-Proofpoint-ORIG-GUID: JMutR8ilzzOUc5X42jnP9nEIO7dAc0I0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123

On Fri, May 15, 2026 at 11:42:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `iris` device tree node adds an `mmcx` power domain and two `required-opps` per OPP entry, which violates the fallback compatible's DT binding schema and causes hardware instability due to unhandled power domain scaling.

This comment and the other comment for SM8350: no, it's a part of the
media-pending tree.

> --
> 
> commit 39fd9222ebc24cef337abe30cd891e4af77696e1
> Author: Konrad Dybcio <konradybcio@kernel.org>
> 
> arm64: dts: qcom: sc8280xp: Add Iris core
> 
> Add the required nodes to enable Iris core on SC8280XP.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index 41c57e7dc4333..45e1dd5a230cd 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> [ ... ]
> > @@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
> >  			};
> >  		};
> >  
> > +		iris: video-codec@aa00000 {
> > +			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
> > +			reg = <0x0 0x0aa00000 0x0 0x100000>;
> > +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> [ ... ]
> > +			power-domains = <&videocc MVS0C_GDSC>,
> > +					<&videocc MVS0_GDSC>,
> > +					<&rpmhpd SC8280XP_MX>,
> > +					<&rpmhpd SC8280XP_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> The qcom,sm8250-venus fallback compatible is used here. Does the
> qcom,sm8250-venus.yaml device tree binding schema support a fourth power
> domain?
> 
> It appears the schema might restrict power-domains to a maximum of 3 items
> (venus, vcodec0, mx), which could trigger dtbs_check failures when mmcx
> is added.
> 
> [ ... ]
> > +			iris_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-240000000 {
> > +					opp-hz = /bits/ 64 <240000000>;
> > +					required-opps = <&rpmhpd_opp_svs>,
> > +							<&rpmhpd_opp_low_svs>;
> > +				};
> [ ... ]
> > +				opp-560000000 {
> > +					opp-hz = /bits/ 64 <560000000>;
> > +					required-opps = <&rpmhpd_opp_nom>,
> > +							<&rpmhpd_opp_turbo_l1>;
> > +				};
> > +			};
> > +		};
> 
> When using the qcom,sm8250-venus fallback, the Venus driver currently
> configures a single OPP PM domain (mx) via dev_pm_opp_set_config().
> 
> Since this node specifies two required-opps per state, will the generic OPP
> core skip scaling the mmcx rail? When _set_required_opps() in
> drivers/opp/core.c iterates over expected devices, a missing mmcx device
> pointer might cause the mmcx rail to remain trapped at the static low_svs
> level voted by the videocc node.
> 
> If the Venus hardware operates at turbo frequencies (e.g., 560MHz) while mmcx
> remains at low_svs, can this undervolt the hardware and cause system
> instability?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com?part=3

-- 
With best wishes
Dmitry
