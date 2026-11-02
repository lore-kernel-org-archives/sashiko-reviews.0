Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600236;
	b=d5P9VUdm0Znk7DA99GN1IvQXU8h7nupWJ7rQUm4X61h/oTsZaPUJtxeKtjenMjK109WD
	 rt9GXE6WRUvtSBIVQ9ksk4QtFZfgk03nzyi2dMii+sCfKo8SZiLooejoS97xJvSv5qn7o
	 xV6FWOOmLQUnFc0iUyOWnHtYHoDkOH3Cr+aG7gWEIToO2/QenEoJZ4AC9zmw4teyX0ZcE
	 xKe2QfZwOmIEAaXjgfU5nqTCeLs/nZmR02uOD1b7+8f0i5I4ladQMQWGr8HHtHJzgXO8k
	 E7DdB2HGvwjP01lCrXp7KTdKK6DAeGSF8sPgov02pITGhESGEoj/OWWIII3OE8BCQXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600236;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=;
	b=nr+MpzZ04z+l7KEMEhozEimcOZpTLSl7uESsJb3jkNEfUnNGVJ2Cjnq0hLxNP/yNvPaZ
	 wYYGJqjMlXpuiC+frrflAwm7z8KFi8tdvCSKhVi/ibMBq+Eo+vzu+dmzPq0Trf+A5Tpxi
	 yN6omOd2iG9psLWll1BkwLIYde+rG3oK3xjBP1dKZSoz2pmg1M9ON+OoIle4lVae5UHuX
	 nqr1DMNx5bk4Ga89wW8dRFa02Oa/hA8EarKs61TNQO7ZKBJ6imMbH2tbwYPNXzL9ptMTO
	 IJ8Ib6yiWMCRsvN7b6zuNDa9VMKV1vjWwiBaqQZH2zWUbe+BStvO/OSXrCnSMvLtuWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YxbHo/6P";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYh7lbmJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F53606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 06:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F53606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YxbHo/6P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYh7lbmJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vs6I2717039
	for <sashiko-reviews@lists.linux.dev>; Mon, 2 Nov 2026 06:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=; b=YxbHo/6PcAeWxhm0
	o4AVSc3jsYWfDY2eeenHh//YjGQsUfUzT9fpeNJmgwMvzip9i1aYIQbi/oK2lsgd
	wZZfRLR21q0tFGDQoTWayvUwwdMOOTzTidy5OgDzEAsCexzJ+kLXVkxPBxGfnxg8
	wIEP88J0icYNMGkimBJi7xgDpYaSmpnqzMSSjBeVyRxF+GqXiAb7WKM792aF0YNS
	iazCASxsJ4cdVF1+kChyGe+AZ4p7Xxf6k3ZcM5FQ1n7vqKHxqH+ozQ1b1vbOPH/2
	1nVtdkuGzSQTGTtVPCyZZmd7sY4CSXYZbBuXtCTEreiLyFSpMzYF/0AiAhPXMdVE
	u3d9yw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2web3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 06:17:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so12296020eec.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 22:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793600234; x=1794205034; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=;
        b=MYh7lbmJ42mdWCTSgJy9tqsQEPh4cS05wjedzrZ0mYSAFcEw0aTan2vTLLe4cqG89l
         9KoRtWIt8C3g6vGqSnni+otNAlFlHDqiwDxaOh2qOpIwC3OWHZJkvob9TJE69F24+kKi
         luycs0c6znyQyTgNE4WcSVn0CcqJbqvFwA1A2L+Zgh1vCjLKDrXGuwFu1SKzx9b3YaHd
         1zRbk0XAqyyLFf9A5U+OUXnagNDCVi1qXYl5lH39p3aFRwG70G6pQSlJhDPTSkgfVxGz
         3haIGwLhpT27zQXqxKL7Cp4zEcC2L2YHGrZExmxDZHe9G2nov1WEVMFBfu/sn3yDQJOO
         21NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600234; x=1794205034;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=95RVMgAnEQsz6u2Zau/H7ip8VDUUfRIOwf1zoFXTm1o=;
        b=erR++6xabXvJuCGkI/DmNwbFzvKDf4GlbLsZ9r2HIhKCm8mFwDcP0Sxz0fLX7Q7t7O
         jIV9xBZyGNUjVOiQIFheQOrT+hbzaeX9oCaRs58DTQ1EXSAgRqpn+Mata9hEXUSFm9Uc
         stf/Wlf1stEXMfv4XAqPK+qy9/b7JVSZm4RFOuUaB/8fz0cgbK4pocZQJcYeFFzBCChi
         M+qvDZTsf1JxCTQ1hqRthcsGFf199tta9BBzK4ZBelKOVT+xz4Ji0BNs0dw5+wrwHuBa
         HEs6NIrj2Kacny8ahP2PQQO5WmtVBsqWmLf7U2B4Dh5DjWse95ok1lrUnr79jyuDSaE/
         JiEg==
X-Gm-Message-State: AFq9FYK7kXsLqGs8w30xf6dufa4UzXDBdkrG+gkX5LjbdJDHo8s8F8o+
	Mb3EJhsrr7dcNUJ4bcFSFFYakKa4BBzTT27CH5ByuDxnYn0V36u2Ba50uF19+uSdaHl1O7rq4OO
	LKvi9YJnklBWke6XjgYnjGDN/rH96CW3RTOvYKp13LE/shnbI94fAYtMb9WnvgBEQaFbkOB+N2Z
	2fpvQ=
X-Gm-Gg: AYBFou3bBeN7+9YStWIhFIYM66/oOLdsgtMyUxtwAEec+tC0lyYWkv9tYRRbp0oho6G
	82V9y1pwfCWq+MeBKrv8wPbr+8+iex2HNiQfiXvhewaDvWqnqL4jxKihQPIlcP0iaHUqXfNwCyh
	cbpx9Bd0KiW/33/cNeTETgowFCN8Z1V6oI4mA9ZmEFqrmb4v1BTT/Ip7mMq3SSRDzIGxrwCglxE
	EvoDJ9lxrYLo1NBCpuZ/LQYya5p0Qu2Mf/v0GsJvUrQHA3VfpZbWR1N3U7nFL0hrQxMhtpEQdPA
	QOYZWTYskgt7wl/uskeP5EJgp8peQFWDE1RiODn0w1lneabyfW6DQZphYpnBCKtmtYZkn3BFtRT
	4TCMx5Xrb/SaBIuFcx7rpBT5c5DVb4CrS2iJ3QP+HCe5X43NdY2BAFUSERnQXGrExFs7JGmU91K
	Ya3P0=
X-Received: by 2002:a05:693c:8803:20b0:369:f0de:259f with SMTP id 5a478bee46e88-36a424085bemr15785049eec.35.1793600234113;
        Sun, 01 Nov 2026 22:17:14 -0800 (PST)
X-Received: by 2002:a05:693c:8803:20b0:369:f0de:259f with SMTP id 5a478bee46e88-36a424085bemr15785006eec.35.1793600233404;
        Sun, 01 Nov 2026 22:17:13 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm39030238eec.11.2026.11.01.22.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:17:13 -0800 (PST)
Date: Mon, 2 Nov 2026 11:47:08 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO
 G133HAN01 LVDS panel overlay
Message-ID: <augq5KKjnUcSPCf7@hu-anantiwa-hyd.qualcomm.com>
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
X-Proofpoint-GUID: G61z8kmCsaTK1pOSqG1gt0_oqm14I5G7
X-Proofpoint-ORIG-GUID: G61z8kmCsaTK1pOSqG1gt0_oqm14I5G7
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae82aeb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Idjim9wqd_vywzO8aGYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXz3TtngIsaMqH
 nIS8oUh1dbDd9IckRf85Wv/LtPfoOwNvpSkUy8GDLjoU31MMi8m8SJhr0pdhnXKlVDCzTWbi76M
 k5X1QT8Xu22v5mHngwR4PPjwov8Fg0Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNCBTYWx0ZWRfXwbKdf+yKk5vS
 39EEZ30h3eev36Bd3Dxa1U/VBgSQSlJyHWpU57jByAd+55DNRnlSQ+tnHkRDSstPAIfyuU55P/N
 Z4WJX3TvQMmTeXU3xjgS5EUs5RiQtq5McrSj8u7mq1VU3troz8bJ/oPcFpTASuvg1McSUyUXXBl
 tMfrbbMaNRk/lOOOABw+EIz4qqyRe8CBIYkwhGCwgh1yewSRdqiukkxxW7JLzbpSE6qPBDiyMrW
 kVcCVn6nAamEoS4q66ZCEvfIFp462nUhHl4uLIB1hh/qQ1xw33u8XE8GGvrhYmvXv+NbCPbYVJO
 jXTzrRdSjvivwKNFQ68HpPa4WzbLmcfCjnXfRdKkLmEMk6MUUzR3iFJd3R+qMUOU1MDNm5kz7ZJ
 su37XwmYhCoMc3r+NuQOG5svC6WFlC1npmAMsH8rZgQJBh5kjtcFnxBufsJQHX6xoakedP2gtjt
 e+pgj2A3WGAXVGAwRBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020024

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
It will work with GCC_GP3_CLK. I'll Update the dependancy in next patch
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
It will be dependent on below changes
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
+	F(10000, P_BI_TCXO, 16, 1, 120),
+	F(100000, P_BI_TCXO, 16, 1, 12),
which is present in patch https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
We will add dependency list next patch.
