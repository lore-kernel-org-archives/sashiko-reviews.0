Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369342;
	b=rLOyjOllG5ukCW8kjWxPpNp0oKfZaj02Uxr9mTG37hT7lzoCakZOGSFhNas8Dmmlyaz1
	 XG5ANBhOEN2p/4mrY9FcpgsIPSuENLPpJSzWq04/aFpJILNKXW/lYEsClyJ4V6l2v2svL
	 TRhuY1ZyQw5xI6oEIZmL/H7U3k9WJdWgPw6jx7iHqGSsbC1CeSpqkFCO86LZpT0Yx84x2
	 Fq50AwMZFjKVKwHA4uM2NY0FMnYnCj9xokE8S7t3cHzcPDsuEa7aV+fTZlyUcRY+EPTO/
	 KsbmV8JKlxneAhL9ogXtXfK8byA36OoyCERhC7uzfWtUsZhAA2blqVWKr7SZ05DthuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=;
	b=2B+i4tIJE5xV1M+6wsuXagZbvGi5QlZ4pBJVowji5/GsQYQnMWEhzoipaZ0oCc2M8jTX
	 oQHYm0IvdDZz7+gJTvpLs/4Il1+1XI7M56hVZvxk/9egQmZ4RtxjJuQZYfhKf4FUoUPtj
	 TzzYe+0k8WTLQMnogLD/UXOWs6BA9qigUsFNTbphb5h9CfxGcyL/oLimiuZ3W0JUTJeBB
	 c2Tl3+thWkVPB08deZk4fwVuOVKRGVVxqkI+ARySTLD9HD829V6HdvVmVURoTKxzhnFlA
	 uySkhCbF4UNV1pn7Yh3fxV/H6l6pZJQCK21PYIhnR5C4eq8+assleUzJ+724X3KSTEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcsitUX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AT1BfPwc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA58606A324
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcsitUX1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AT1BfPwc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn8id3122887
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=; b=LcsitUX1hyv8NOPL
	Q8VjbeHtm0DxfEXWx3GQZthgTkQR+bR3uGQye15mefYe+7TktjEgFgK2kJ8RuK9E
	EjZbuo41QO70LWgwshQes/qJeKTtuHwkL+QvbpY6OP0Aja3VOohdGsm+kOLoq4yV
	Ib+AWfZSG5EmNDiC3Reut59iZVRv5rQ205OlHHdo6FQEqHUlthgg9d1SqWEvIk8S
	2/y7++n7HBjJRIl31GYSjx9eLiEhU7hzDFhsNgegofgBgYb0b9JQy8CYnevzUncJ
	klTH9aASMHHs0/lslVBnpvFycjevOl/9yb+yGBPLKEbn9anF0HVRvH4C7lawccFW
	ePzcOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkd40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:09:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so328945a12.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369339; x=1793974139; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=;
        b=AT1BfPwcHYvINbPJie1siF5Hly3REf55oj6bUY3TvPJaadXmsB8ZmZzllT6BRZX48z
         ytHw3Lq9WbXeGIgxorzOrawqX4kr8iXujl95/j6v+W/AMGA6yBMKiIoJhOUo8ticqgpl
         8j2jHazwJUHTdjQtwMHVqvcElK8WnPex0rj0hJB96JGjwyeSBuHP7l47TgAz1ep67Gch
         8/DoktNH6hfxSOemkgiGzUy5CdLyL7Zh2lHmcRGz50c6XW7QXDjn5IxCvFdVyd7WFwH4
         VjuzRa16FEMZna4K/9jlUTpD9iB/tqp9k4t56ibQVW3Matv/RwwBV8xpumDKR8Ll/WRc
         jFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369339; x=1793974139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WjVxx/921lt4hza8TI06z56jcaiHMvhRxqwg7tmh3rA=;
        b=V8cUfBCGgbbhVTc9OeZHzdEb3Yyr/I/jO6k3ZCXRprRbAC6wuCAs3RLCejSIOVEh0x
         SFadSvQyEH2SdbyQMdxxuMSGfcHSDy076hXCIoRSz4sncM75HvvFcaG1/uHRGvQaX69V
         CCVHrRP/RfSoV6SIBu79QBqObPwa/4ALEwb9qkRn3BRiFkqeva+vwxD7HGK3E9IW9lOB
         wLxYJh8hiMJKvZjWIrn465PfgkShqIsbgiTw0kzaOcBytcGnOLnxCxnrhoOZqZoi18cQ
         eRSMglvqIsbmDZFqQC54LPxTH+QyYvRlq8h85TqqOoVhtQQ3MyuS5mX74Gl3G8SKrrx/
         VOeg==
X-Gm-Message-State: AFq9FYJiRARxMpLoZcfIveAF98T6jbAmHD/1hSgqT+JlURIks9+M3Csj
	Fwqc62pIHzDTgD8xzyRXAVuAry73ucqyCPs905elQWl1Kx4gjffFYhGe1wRWrlUUHr38b1x0rHk
	eRiMsvjYfKO6w4nxzqwjhZ0iXbPNkbnMRTriJ6MOXNFumeJDyAdXXl8rYVOFbHtCxC1C8pA89fd
	Ipci0=
X-Gm-Gg: AYBFou3ydWeRiztoRU1mvsJggn2yTqdCaMy5qDPcf87526T5ITLE/gSmth2dUo46iba
	bTrVPmTLzNeAGr4258DkblIDCfKLhpx5LzFjUcijdiO2SUIHt9Hetg3T7ajzBboXCFErRCmlZTP
	2oDj+EGwsbT3BFlIyLApzHCzSQQMEqEFOfDf8RxYIsOSZADH5mibCEuNIRTdykczu9D5ej5na8o
	j2Sgf5UtlSqAWpGoo43Xs5PUOyh57t/SLxoS9oL2KuxUDYyTWd1/DIpC7YaT53MdlT0uRF0/v8a
	UEzQsfNDOqruJ3AuPNyiogG19k8+fz3/c43F+Dx5RNRB2RzB62utFWpfmFKh+XMputvEPcZFMhN
	WEvd7tLr578KOsBYoRP9i9BQw66DSa7CVwHnpmRn/5ufVlRXyrWoH8vCiFcw/udgz4Yi6Em857K
	Auxyp/
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr2139322a91.63.1793369339046;
        Fri, 30 Oct 2026 07:08:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr2139298a91.63.1793369338529;
        Fri, 30 Oct 2026 07:08:58 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm4141700a91.11.2026.10.30.07.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:58 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:38:54 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO
 G133HAN01 LVDS panel overlay
Message-ID: <auSk9hYrM8Enqc4r@hu-anantiwa-hyd.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
 <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
 <sashiko-outbox-190778@kernel.org>
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
In-Reply-To: <sashiko-outbox-190778@kernel.org>
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4a4fc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=97I3IBaX8FsKqUO26lEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: nHXpNgMjTyL4C6BpMebyBVoNSWDq3zK1
X-Proofpoint-GUID: nHXpNgMjTyL4C6BpMebyBVoNSWDq3zK1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX01af16hbvj84
 Q41w3WTxtO2TohV+hoj5LsUJHaayTBGFRx64v8/Nvq8y4jRlz0f2qphSLEw+zUzKdNCZppzULPi
 tfeEgV0/4/Qpu1+hMpBE7dsPRx53mLrTVKHUMZZFmJsctSVCTKeU05r4AASBviQREHrWepPZIVp
 Mlsb6vy+VTYbFZAFGVtVbZwDBKSiesGax8O510sUBrZc6eLgr0Q1/5RF/hV39KwG8Piw7vX7O3h
 Ro6zkt3bru1rrld7jvvtyEZAedUzvQ+1yc0Jk/lGWft0Nn32h0/+WzNBW4K39HPqZt44wSicQ/5
 UhHlMEKB2Othp+oywAWQJg5j9pxWbpUReCRj35EQ6XOpAEK0ml7n7wySUmFwBAsCHhtcUTOfVFt
 sLeat3dphL759csie8bq+DhLRtzs9AKJrm9oVtaJHUs/jaxFsXrPnGvUCGVf8SQllq9Qp3n91P1
 zOpjFpyeHaoD7Q8AVMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfXwXW1rDvtVwYT
 8cm/TP4oXV98IZ5Jbnhw56XBNX7b1WY4tmNYoDKqrJfDodlJdtjfcrYjy26CTxyr5IsfggHmdsA
 kyLhVuDPmT7vPe5iiArW0ubJrLv0czI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300056

On Fri, Oct 30, 2026 at 09:50:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] arm64: dts: qcom: talos-lyra-evk-lvds: clk-pwm on GCC_GP3 fails with -EINVAL
> --
> 
> commit c54a5c6f3e0408807da76cadc10d556338f09c09
> Author: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> 
> arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay
> 
> This commit adds a DT overlay for the Qualcomm Talos Lyra EVK to support the
> AUO G133HAN01 LVDS panel connected via a TI SN65DSI84 DSI-to-LVDS bridge on
> I2C5, with backlight control using clk-pwm on GCC_GP3.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
> > new file mode 100644
> > index 0000000000000..8c592e6317c30
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/clock/qcom,qcs615-gcc.h>
> > +#include <dt-bindings/clock/qcom,rpmh.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +&{/} {
> > +	bklt_pwm: pwm {
> > +		compatible = "clk-pwm";
> > +		#pwm-cells = <2>;
> > +		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
> > +		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
> > +		clocks = <&gcc GCC_GP3_CLK>;
> > +		pinctrl-0 = <&bklt_pwm_default>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +	backlight: backlight {
> > +		compatible = "pwm-backlight";
> > +		pwms = <&bklt_pwm 0 100000>;
> > +		power-supply = <&vreg_disp_3p3>;
> > +		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> > +		brightness-levels = <0 255>;
> > +		num-interpolated-steps = <255>;
> > +		default-brightness-level = <128>;
> > +	};
> 
> [Severity: High]
> Will clk-pwm work with GCC_GP3_CLK here, or will pwm_clk_apply() fail with
> -EINVAL?
> 
> When backlight requests a 100000 ns period (10 kHz),
> pwm_backlight_update_status() -> pwm_apply_might_sleep() -> __pwm_apply() ->
> pwm_clk_apply() runs:
> 
> drivers/pwm/pwm-clk.c:pwm_clk_apply() {
> 	...
> 	rate = DIV64_U64_ROUND_UP(NSEC_PER_SEC, period);
> 	ret = clk_set_rate(pcchip->clk, rate);
> 	if (ret)
> 		return ret;
> 
> 	if (state->polarity == PWM_POLARITY_INVERSED)
> 		duty_cycle = period - duty_cycle;
> 
> 	return clk_set_duty_cycle(pcchip->clk, duty_cycle, period);
> }
> 
> In drivers/clk/qcom/gcc-qcs615.c, gcc_gp3_clk propagates rate changes to
> gcc_gp3_clk_src, which uses clk_rcg2_ops with ftbl_gcc_gp1_clk_src rather
> than clk_rcg2_gp_ops:
> 
> static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> 	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
> 	F(50000000, P_GPLL0_OUT_MAIN, 12, 0, 0),
> 	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
> 	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> 	{ }
> };
> 
> Because all entries in ftbl_gcc_gp1_clk_src have m = 0 and n = 0, calling
> clk_set_rate(pcchip->clk, 10000) rounds 10 kHz up to the 25 MHz entry,
> switches the parent away from RPMH_CXO_CLK to P_GPLL0_OUT_AUX2_DIV, and leaves
> the MND divider in bypass mode (CFG_MODE_MASK == 0).
> 
> Immediately after that, clk_set_duty_cycle() calls clk_rcg2_set_duty_cycle()
> in drivers/clk/qcom/clk-rcg2.c:
> 
> 	/* Duty-cycle cannot be modified if MND divider is in bypass mode. */
> 	if (!(cfg & CFG_MODE_MASK))
> 		return -EINVAL;
> 
> Doesn't this cause every brightness update to fail with -EINVAL while leaving
> an unmodulated 25 MHz clock on gpio59 (and leaking clk_enable() references in
> pwm_clk_apply() when __pwm_apply() fails before setting pwm->state.enabled)?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com?part=6
Yes correct. This series depends on a separate clk driver fix that adds real 
10kHz/100kHz entries (non-bypass M/N dividers) to ftbl_gcc_gp1_clk_src 
for gcc_gp3_clk_src: https://lore.kernel.org/r/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
 Without it, exactly as you describe: clk_set_rate() rounds up to the
 nearest static (bypass-mode) table entry and clk_rcg2_set_duty_cycle()
 returns -EINVAL. We will add this dependency in next series
