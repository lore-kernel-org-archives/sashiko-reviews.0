Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644676;
	b=g6n7fAEn9x0SfKjC4N8WmyD2mIUed6kXav8UVShrMQ4JRHRIBLsMV31l/QiPraPTpPHi
	 DNODxV4yQlEOlOCwE2P63SWemJF+pqbNexZpozOnT8pGbCNMXngiz8A7aaqxnvVlWxMMD
	 ZilL0eXC87Jn+FHPOOiYFlyz6/H6JLpmYhKayJfnEo4XPfVSybfj4puI0d7mXA4nSPDEk
	 Ki3WS+s1wrB1FF/3gFMxsK/PYAWWEN6XlF3x8OiqW8as+DCgo6ptn7KLXq+jIIK8ptrPb
	 1RDwqlN9GZ/pqsOzb86g+VHoBTb6/KoUNpFA6FOPQiTCJZcBLPBLixN1iWhgyp6Mg1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=;
	b=3WyccCS7hx51nfV/xQnKnaffsvdDSuIqr3HA+UZi7cl56/C9vi64ss3PK7lCm4sLD7l7
	 6nPD9hK7x8Y++tOC5AkdiyA1fek7LH6hDISsLSx58yne7+s4zEsMGQNVSbegXYl+3vIQR
	 xbd7AbmkUwN4sVbZhcxa6bpvCArT20v0c5kLgMOs4GxcjiruouHMuf7WWJVmTHAYouCWb
	 oCCLFk0JTXaIhACFSHC3kzolK+XJpvkksNpQPLl0yeFM+iSdSQ3G9uYZJzwnlzu2UcX5Q
	 ZQe3I0Ixxp9GXBmRx/Ldz43NfdtkA97nMoOI91Ei4easJHZ2l4XB1p8w/90QTranDeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUvU24D+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=alLfgkQv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E1C606A330
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E1C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PUvU24D+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=alLfgkQv
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE60iDW3356448
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=; b=PUvU24D+1RsVP8Ui
	CmHYXbLsHgFSIu4rYqAFbeVrlYWis28CUo9/g4OsbqlC3gdWqr3StS6MQWtu+dAO
	BPY8w2HI5hIGY6kHr9xtHjOWSR+RKpgcGYzDgU94Nqv1ix4BjDnIkmPd9UjFQ4aT
	E0d7xrUV3ddxltDh0kpu/I0XFawKI+BFB4RP5M59BQ+pZ/UttC7KopVplvKKRD4j
	qKAV9gwqAvYYZH0pXtQrygqI3j8WVRHm8AGTyPAdSJYM2flQ/dINEvfpPECjIaix
	6ob9zbMHQxH9PvtJK5aN7rrnPBftPpHZ3L0RomOsFewRiUrNiuxgA6BL4taBht3z
	FqCK3A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgad8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:24:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c58d35c0aso282924eec.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794644674; x=1795249474; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=;
        b=alLfgkQvDIs5gUQ/6dTgzPH9D9w9AEHty+nhbXpP6ix0RNCCFJSmfvUOarQQERFcQR
         u+FK80H4u5Cb9LACcjgXrEKEmezf/uDTRLxuWFRu4ZGkygab99xxEgcd/Q5m5/Yr3z8d
         W/FeqKCojhD9/DKE3yfg4MQf2FWg4fbKaVoNyGJw5EOkWoGI/TTvsuW4zQ0t7LiHLlY2
         TYX9/hqPMjVqbQu2RvwboctwbTsYvTnsTyHGaLb7GiOPVQbyVTm5p3NAheNbuYdz7F8c
         FcIwaR717eA1TtXRQ1W/T7NPF1F6KtQm/GSMZY0R2Re0NwS4i1mK16UcU+5J1Qmo6uMP
         s1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794644674; x=1795249474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tkWtdDuequrHYCszXeT2SZPTUr5U6H8Js9diPv2r1wI=;
        b=jjeQgyqczuNCENK2Hn41/BHv3yDbV6MVaISo10yRLF4SDRqCetnthqIxex5T960zqI
         CBLqTukR5T2XDOW74mIa8eGzK9kBHvw8F1tK6Y5cKbQxo1HDpn9UfZEQErpKSjJB27ua
         7supz0dzZ6w3jL5Sw5T+04z5z+5eSpoLlgczWOOCmOv+jXJZ1N+piSSvderUhhYatHF4
         LoRJd/N50u0QujwubIVX8Fgb7qwkrXYzqVSsrBqLlpOiCVroMwcc/07zQomJv6/v9T9D
         pzPrpXwXEkF7DdiIp7wh9SWC8hvjzyQUeYjfCK8MS9h4QOhXii+8fUnpqXcH1rFDo55V
         bpSA==
X-Gm-Message-State: APuU4Z9WTyV9wu0Dla+outHtdwOeNCVvZpcl9/VaIafBrZx4Z+cRXGCn
	/NDtfH8Xg7RmG2NKzlrn/Of1432CwafP3kk+pSSOhZBSFvcv7bPpPcikGRV/hSFeNNpHhPF7Ati
	QLxRrzoS+0oq+PM46QbuMeBTsOJV8QglJ9EGVoyl8zUprz+E8JMr/J6I+1dt7oeE3vdpFUM+52r
	dxr/8=
X-Gm-Gg: AYBFou1G62bP10qITruRNrWKhKKeWbBEh0ZrNEkMrl6wyJTMYgosZzMGTXHTZbyFqQc
	UqgxYWPQbiBl1zyxEe/S+89J2wEAlWzWmB2b5r6AVLjO3DJ8d+AejB1phVXmS2Ll1lRGldA7Zdu
	9M5q/gMw5dPJT0j/9hq8TsdsWvzYQPRBHaJHCIdrhiGZzy4qw/ayBQKOkKBMrh3TmJBWoT5+c6k
	HrEAAfpHDDdx5MeBlXQ3IaaTETLk17cu4/UmMhyr1/HqTFapnzzD6QfEt1dEOq17H5t29XdTJdY
	kdHZPcop8ijKgNBHsxSbRespIiWUgsYAhOZnLHzsR4iFA8JMJ0X0hyXiuCOPNp6aWDtEA/BI3cL
	tWf0ofmxIA1E5e4iOGsR+i6IEdToRLR6Xd6e6VwOJV95qNPId6R5lJHM9iu/so6uZRm+6l7cEpP
	vJo60EDxB6qW+SVzqps7682V6xtHqARKKzzaLXbvZLaQzLILzp0qH7Kuu5/1Rv3jDvjpy1hob/+
	qlJsfKTWciBeecz+UbkmPrbtNPbXw==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr9318918eec.2.1794644674090;
        Sat, 14 Nov 2026 00:24:34 -0800 (PST)
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr9318885eec.2.1794644673490;
        Sat, 14 Nov 2026 00:24:33 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm13990323eec.29.2026.11.14.00.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:24:32 -0800 (PST)
Date: Sat, 14 Nov 2026 13:54:28 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8"
 DSI touch overlay
Message-ID: <avgavFfjUpK/uGWY@hu-vishsain-blr.qualcomm.com>
References: <20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com>
 <sashiko-outbox-213671@kernel.org>
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
In-Reply-To: <sashiko-outbox-213671@kernel.org>
X-Proofpoint-ORIG-GUID: 1rH663jTPMNVU2CQiDMe2MHJOl6WFRjs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMyBTYWx0ZWRfXyCDNgB/PdKtF
 0axyO4CaFoy+rfMFzyWKy5Wamq9O9O+ghJevae0PzOUpjP5Fls3CnmkRZTTCqjN1a1YXZqoz2c0
 QmxUeImSSFc9JMoiHCTPmHBtLzJ8GZPZpof+GKU/K68nH5+ksRsOAmy048dY01/OA1BBu93NWYq
 foYJo1jvbWgx06pJgFA7CRcOBEn6FJStoW9Uf4bN7xF7AKwvZnJEDB93EXqLGT5TxTsn9dnrC5w
 +FmLxYiH0aoVgviGJk7diRWKqQjtgYJpAAbts27jgPoGaT3g/qGwBeZ5+S07XfN/0sRx0nRqAnv
 elbCCoEumHAVWCDr8K8gPKmMQG1179TO/lCgBK23i6sqQTXG6olDOwMkLhHvnpH1vfK9zhBXfNQ
 Ct5aK8W+ls/ENdemlPyY5Vqma90Orpm84WegaYtnAH4XID9bndallhJG+QJppRfder+zD9q+1xL
 5ZgssW+3vvLWPfVXZUQ==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af81ac2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KXWT9uR0CYtNx511idsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 1rH663jTPMNVU2CQiDMe2MHJOl6WFRjs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMyBTYWx0ZWRfXyw5Zcsy5h138
 j7faYwVhkCikHQ+VNFucDDbTVtnzD41oAwW5m68Xfo2pHx7qnRMyTMEqGWxu0Iw6LM0r3HEjQD3
 dfEu0mqfvxUiCGXk2wXqxbB0wa7qZSw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140033

On Fri, Nov 13, 2026 at 08:42:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: qcom: monaco-arduino-monza-waveshare: wrong
>   mdss_dsi0 vdda-supply
> - [High] arm64: dts: qcom: Makefile: monaco-el2.dtbo applied to non-EL2
>   Waveshare DTB
> --
> 
> commit b8a3c8f8c7e536ea10afaadd72a3ac9f01d55e3c
> Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-arduino-monza: Add Waveshare 8" DSI touch overlay
> 
> This commit adds a device tree overlay for the Waveshare 8" DSI TOUCH-A
> panel and touch controller on the Arduino Monza board, disabling the
> shared DSI0 HDMI bridge path when applied.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 8329c06b60a3f..faa0e0f7b867f 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -83,6 +83,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza.dtb
> >  monaco-arduino-monza-el2-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo
> >  
> >  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
> > +
> > +monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs	:= monaco-arduino-monza.dtb monaco-el2.dtbo monaco-arduino-monza-waveshare-8-dsi-touch-a.dtbo
> 
> [Severity: High]
> Should monaco-arduino-monza-waveshare-8-dsi-touch-a-dtbs omit
> monaco-el2.dtbo?  Including monaco-el2.dtbo in the non-EL2 target disables
> gpu_zap_shader and iris, and attaches EL2-only apps_smmu IOMMU mappings to
> remoteproc_adsp, remoteproc_cdsp, and remoteproc_gpdsp when booting in the
> default EL1 mode under Gunyah.
monaco-el2 is default configuration, i have verified panel both are working. 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> > new file mode 100644
> > index 0000000000000..003c5bcea4973
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-8-dsi-touch-a.dtso
> 
> [ ... ]
> 
> > +&mdss_dsi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	vdda-supply = <&vreg_l1c>;
> > +
> > +	panel@0 {
> > +		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
> > +		reg = <0>;
> > +		backlight = <&wsgpio>;
> > +		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
> > +		vccio-supply = <&panel_iovcc>;
> > +		vdd-supply = <&panel_avdd>;
> > +
> > +		port {
> > +			panel_in: endpoint {
> > +				remote-endpoint = <&mdss_dsi0_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&mdss_dsi0_out {
> > +	data-lanes = <0 1 2 3>;
> > +	remote-endpoint = <&panel_in>;
> > +};
> > +
> > +&mdss_dsi0_phy {
> > +	vdds-supply = <&vreg_l4a>;
> > +};
> 
> [Severity: High]
> Does setting vdda-supply = <&vreg_l1c> on mdss_dsi0 overwrite the SoM's
> 1.2V DSI supply with the LPDDR VDDQ regulator?
> 
> In arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, mdss_dsi0 already uses
> vreg_l5a (1.2V), while vreg_l1c is the 0.3V-0.512V LPDDR VDDQ rail:
> 
> arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi:
> 		vreg_l1c: ldo1 { /* LPDDR VDDQ */
> 			regulator-name = "vreg_l1c";
> 			regulator-min-microvolt = <300000>;
> 			regulator-max-microvolt = <512000>;
>     ...
> &mdss_dsi0 {
> 	vdda-supply = <&vreg_l5a>;
> };
> 
> &mdss_dsi0_phy {
> 	vdds-supply = <&vreg_l4a>;
> };
> 
> Overriding vdda-supply with vreg_l1c leaves vreg_l5a unvoted and causes
> the DSI driver to disable the LPDDR VDDQ regulator on display suspend or
> probe unwind.  Both vdda-supply on mdss_dsi0 and the redundant
> mdss_dsi0_phy node can be dropped from the overlay since
> monaco-monza-som.dtsi already configures them.
I will correct this and remove the redundent phy supply in next revision
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114-monza_waveshare_dtso-v1-1-4b7c80e90e08@oss.qualcomm.com?part=1
