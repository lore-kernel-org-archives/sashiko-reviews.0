Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D8C409138
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 09:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502451; cv=none; b=LG6VEYotYq/yppyOgid1MACIC0196kU/YxFOXILLkRhOG6Ve/vDU4dRpdew1Jen8LhcMO8REZE+dFxSc42JtReWdgQNLCzyjQjmUYeGM/4+dlzH6G6a2uEJErF3/FJLqnhRt1VkZ1YrHJLdUYd3aarEdMR7hIXLihxkvybS0kk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502451; c=relaxed/simple;
	bh=Qe/rQGLvb8bcAyOxTvi6MXdbAotsqfoswULLVdrBmAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCP6jhFwPQrXvZcTlivHk0Qq5j8zW2qBG3elDCIssFa3wR7gvjQbyD+LaOyYN3a97vP6XbyyfAFFe+Uopb8e+Q4AdhzzEtRZoBG16GCY5vuslDMjQuY/QkyJdLKbAsnrR5y8Tz1bFEKtBAw8vkTXh7JSfNMKONnqgZ4QK/KtbKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrCqDosB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOHrNk+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrCqDosB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOHrNk+v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889Ba92219742
	for <sashiko-reviews@lists.linux.dev>; Wed, 8 Jul 2026 09:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ODd6nTq05LunQoKoekRARiXEci4TIjKD6sRgNesJow=; b=DrCqDosBnt1tj9GV
	/issVSE2yY5P108JA7+ddx/AUImgmA1J0Zi0ofAf9aCdFvmcYXvCUZ/NyAJKftF5
	HsLkUf7ZPqy3OKKnUBf7Uqg4w0lvJ6BVrBqfwYlYTbzBsC6SINr25ObRm/WR1sDG
	RQIZYxVnEF13PXyikWSKIO6fW1az8D3DP5G4Dp/mw8RIxeAORGTa4+NTl/SnLAi9
	z+vGvdcrSdKfMELkk3i2KzR5tP51s5FGMNgODDmoriT10u/yAtGpSFRi8YXHjHTe
	2eqJcl2Far2rArSjrUgY+cyj6xizTEUtN/13Qla2OWsoL25uVPTIceMbTwhvSprV
	dynRaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hgxxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 09:20:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so8110295ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783502449; x=1784107249; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ODd6nTq05LunQoKoekRARiXEci4TIjKD6sRgNesJow=;
        b=XOHrNk+vsCtK/LjIBelDqs1AKArbATD4wiWMkz7D/z4dfx7cpGYh/5UkLgru6T5a9G
         kLkrLFRt7aJWzYP9IxU0xQcqvggDspl+WRLyPVzQr9qqIQw+nbgHTI21nOAz60RC7XGP
         MtfgqicTOs8hYubFXzSwvkUcco1Kl7nS2cWjaj+UwmA3S8W+aeHqtpz2VBPF/WZ35Bzy
         rnNuFEkdFc90qlfhuuCHDwphqDwuafFZaqKIoOPg8O0HQwR1iZrouyAeugzf2/maDThl
         DbT3BGDvzlA6/0GcIWXEimMFHeZOlmhFhgdeLUMo9ppju17u/Ciqgaq5Ao9EuAPgX/px
         gJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502449; x=1784107249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ODd6nTq05LunQoKoekRARiXEci4TIjKD6sRgNesJow=;
        b=PEVYtJp6gu68AolduqiINZonDERYSx3fF1k1FQEVeK2ZQq4baO+8UPNOvAYqhXOro6
         0Dfe8/BDfVdXQM6FDbETpryDn1vUmsDqjR4EOkfENXPE3rl25Joe+vxLvh2W5GUBuHJ8
         LTVKSmnyE5eIfs794rdMoJx2H28zxOT7O4JoP3XNFtkOvtQk05DQ4rYP/9roO/plBDHz
         otC3FgcFdakptpQ9kbFicPp4vkK9ECU7gKaDE/r1bBCK5epJBBe8qPQKj5W0kaINowUd
         3O3VYur6fTSUiHiiBd0hHi7+Im3UUMlCMazbKa111Zd84YaV1e1LlaTlMVnpIDRTknjg
         FDFg==
X-Gm-Message-State: AOJu0Yx9GiSPD1l5CSMDyeP6KA4cO/guEAMyFsryptel36SD7QH1I02a
	R9A21BzokMimaSNKeJlx/WPPEHWl8kKgeihqO3P5Rz2GXaEJADQN7vQqzOJcE30atH7nOJWNY8c
	zLSgYf7x96aUnVhTzBNsUvRzyJvyjqOXh6Tq8cVUp11WH1iXOgmKsWqTX+667jagqh3cOp9AB1A
	6PJps=
X-Gm-Gg: AfdE7cm8AUir/e9SHBglfNvcfC5GY/6frR3M7MewsYyQLsC3jtwOlQldFzWDABIEfu8
	1PENgpaneLxrE5dEEvr8e9KDhhHtM0w8hMYONkA14oZWwkrFsYKS4l4wR1lUl7jonPh0HMJ5ZNe
	ykDkje4vI73w7mB1JuvkyZDG6cRH6h9kmdpsUqswS+rjiinHTI0iWLDJuIHDmiI9Z5o3QInEa3h
	ulkQ2G3s702j+qYbKWIfHdAie/ZqvneiWC8TkHkX8aZcT9t2xym+v7OS3rrL9SsHCCZORLQguZD
	RLic1g/j4n6uP5pCqdhj0LIo+BYD8FRfz+BY4kfeFgZUWVQ1Ei9VULeJ2TCW1514idN2vkuV34H
	iCP4QNOI/BNSI4Ctwarc7k39KGah3GylxosM/wITcXQsSysv+hHuppm7m+QzohNgx8yvdJc+E04
	QmBRXY7BbHLIHUzjhWjbPqrXo=
X-Received: by 2002:a17:902:d2ce:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2ccca8c82a9mr60853575ad.6.1783502448544;
        Wed, 08 Jul 2026 02:20:48 -0700 (PDT)
X-Received: by 2002:a17:902:d2ce:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2ccca8c82a9mr60853265ad.6.1783502448001;
        Wed, 08 Jul 2026 02:20:48 -0700 (PDT)
Received: from [10.79.194.163] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8e9csm24995015ad.24.2026.07.08.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 02:20:47 -0700 (PDT)
Message-ID: <b4bd0d99-0537-4a3f-ba5d-7e9fc30f0996@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:50:44 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
 <20260703-ec_support_for_purwa_evk-v2-2-c59aac5c6aac@oss.qualcomm.com>
 <20260703100722.1FFF41F000E9@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260703100722.1FFF41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA4OCBTYWx0ZWRfX2ZCjcLeOrp6P
 qwI2PV3gPhkGfkK2QyUyLHifAeLDJaUN0lplxae/cNv32dybdHaOBA2rd1o2DJpw5dwsFq5BaZ+
 NNKnChvhwlV89jAO1gFAv+KT2GG4TjnRYFpbNfXLD4R235/JsuUATXi3tJG/UuFp2mHtG6BYxZV
 dJtOp1W2rFyQdMeob/ADZ2G+ekZ6m/v51gT4xgR3sTboVQsxDb4kfB0ANYpmpZLgLt5o3+stYIU
 57ojY5xQ+hGl3EY2MRNPLO6qN9yYzh6CR/MvUlr45Y3A+OykJoB1ieoR1zX/ZiRpztvXO4o4iXg
 c2GRQLxM5CgMbL8gdIB7cSafr9EVcmOyIEFQc1pjpZETsHt+WcCeK/AtSzk/uefl22L0xWwHJm1
 WIppI94IIBNWjRoUNeBcgnuYJFA36qtP81V8xlD7HTpgvgQsKHFNLgRlir/sJpDo1ug04BYbE/t
 Cpqp5tgSlbv49/WSiFg==
X-Proofpoint-GUID: 1i5gFkJ21M3GU6u2PItSfI2C_JSWUUvI
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e1671 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6qqzTE0EYeF0Xcc8wggA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA4OCBTYWx0ZWRfX25U9/kx5C/RT
 NIevu9J8afeuf1MLPryJpzik5K5m5gnAW/6GykV2HkrCcKyvxJ2H77VudXLvgsFE30ohfMzqq7W
 87uaWntqTi8TC5LTvYHT58zgA1dBOkw=
X-Proofpoint-ORIG-GUID: 1i5gFkJ21M3GU6u2PItSfI2C_JSWUUvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080088



On 7/3/2026 3:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] Configuring the EC interrupt as IRQ_TYPE_EDGE_FALLING causes a stuck IRQ line and lost events.
> 
> Pre-existing issues:
> - [High] The driver registers all cooling devices with cdev_id = 0, breaking multi-fan thermal device tree bindings.
> - [High] Probe function fails to disable EC SCI events on error paths, leading to corrupted EC state and unhandled interrupts.
> - [High] qcom_ec_read() ignores partial I2C block reads, causing callers to use uninitialized stack memory as hardware state.
> --
> 
> commit 30f797509dd26f2c0981b525ba3d62d1173ae857
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> arm64: dts: qcom: purwa-iot-evk: Add Embedded controller node
> 
> This commit adds the embedded controller node for Purwa IOT EVK boards.
> It configures fan control, temperature sensors, access to EC internal state
> changes, and suspend notifications to the EC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> index ad503beec1d3d..491ea7769cd71 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
> [ ... ]
>> +
>> +	embedded-controller@76 {
>> +		compatible = "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
>> +		reg = <0x76>;
>> +
>> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> 
> [Severity: High]
> Does configuring the EC interrupt as IRQ_TYPE_EDGE_FALLING cause a stuck
> IRQ line and lost events?
> 
> The EC asserts an interrupt while multiple events are pending, but the driver's
> interrupt handler reads exactly one event and returns without looping. 
> 
> Because the trigger is configured as edge-falling, the persistent low state
> of the line does not trigger another interrupt, causing the line to stall
> permanently.  Should this use level-triggered interrupts instead?
>

I checked the EC firmware, events are delivered as a short active-low
pulse per event on the interrupt GPIO — the line is idle-high and pulsed
low once for each queued event. So IRQ_TYPE_EDGE_FALLING is correct,
each event generates its own falling edge, and the handler is re-entered
per event with no loss. There's no persistent-low state to stall on, and
level-low would actually be wrong here since the pulse is very brief. No
change needed.

>> +
>> +		pinctrl-0 = <&ec_int_n_default>;
>> +		pinctrl-names = "default";
>> +	};
>>  };
> 
> 
> While reviewing this patch, I also noticed a few pre-existing issues in
> drivers/platform/arm64/qcom-hamoa-ec.c that handles this device tree node:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_probe()
> [ ... ]
>> 	ret = qcom_ec_sci_evt_control(dev, true);
>> 	if (ret < 0)
>> 		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>>
>> 	ret = qcom_ec_thermal_capabilities(dev);
>> 	if (ret < 0)
>> 		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
> 
> [Severity: High]
> This is a pre-existing issue, but does the probe function fail to disable
> EC SCI events on error paths?
> 
> If qcom_ec_thermal_capabilities() or the subsequent memory allocation fails,
> probe returns an error. The previously enabled SCI events are never disabled
> because no devm action was registered and remove() is not called.
> 
> The EC is left actively generating events, but the OS interrupt handler is
> freed by devres. The EC will assert the IRQ line, which goes unhandled,
> potentially stalling the EC and causing battery drain.
>

I'll review this and fix it in a separate series.
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_probe()
> [ ... ]
>> 	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> 		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> 		char name[EC_FAN_NAME_SIZE];
>>
>> 		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
>> 		ec_cdev->fan_id = i + 1;
>> 		ec_cdev->parent_dev = dev;
>>
>> 		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, 0, NULL, ec_cdev,
>> 									&qcom_ec_thermal_ops);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does hardcoding the cdev_id 
> to 0 break multi-fan thermal device tree bindings?
> 
> By looping over fan_cnt and passing 0 for every fan instance rather than
> the iteration index, the OF thermal core cannot distinguish between multiple
> cooling devices under the same node.  
> 
> This breaks thermal zone mappings and can cause undefined behavior when
> binding thermal states.
>

addressed by switching to
devm_thermal_of_child_cooling_device_register() in latest tree, which
binds each fan to its own child DT node rather than disambiguating by
cdev_id, so multiple fans are individually addressable.

> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_read()
> [ ... ]
>> static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> {
>> 	int ret;
>>
>> 	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>> 	if (ret < 0)
>> 		return ret;
>> 	else if (ret == 0 || ret == 0xff)
>> 		return -EOPNOTSUPP;
>>
>> 	if (resp[0] >= resp_len)
>> 		return -EINVAL;
>>
>> 	return 0;
>> }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does qcom_ec_read() ignore
> partial I2C block reads?
> 
> i2c_smbus_read_i2c_block_data() returns the number of bytes read. If a short
> read occurs, this returns success (0) because it only checks if ret < 0,
> ret == 0, or ret == 0xff. It does not verify if ret matches the expected
> resp_len.
> 
> Callers are then exposed to using uninitialized stack memory as hardware
> state for firmware version data, fan counts, or thermistor masks. This can
> lead to out-of-bounds memory allocations if a bogus fan count is read.
>

I'll review this and fix it in a separate series. it's a pre-existing
driver issue and doesn't block this DTS patch from merging.

-- 
Best Regards,
Anvesh

