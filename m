Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469822;
	b=ie176Z3YRFglAA9ViCpcwKD0MQuslmGHjzoYai942hZTYC1Sw2Sesd2vW9aDKfoMxWi9
	 e9ipUWidYcRwg0tgEcXheYeDMUmhI56fFBABP2zadJf2kl3unGmuwuobUZKoIHvb2mNW2
	 9ZhALlvEUvWzFi7Mu6azn0/axrzxngJQA7I2sxa8DcXtAQVL6WOdGhpVoPO2UoG/p9DA/
	 pF9IDmaR8wVbyFi6nWPZQJfkSQt/KzPQkr/U4xd7wX0lNf+lMAKyR5PT2TsRr+VvpxTUA
	 l1uU8+bhlulnQBVaWj//50xet/i0/quNAgPnGCsu0x9PstV8Z4FzT7RzrJGj7fdgVsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
	b=ZkCu5ArMH6+elAmK/LRm9+KJfhHW6xOlSt/cs4EgKbyj32QulS44g+HXfUVZ9JOQatef
	 OG7rpQBMXXIIxxOLUp+kACANP2u16Ek52S7cSBGggxIS5lpXavwjXq4DEJP2FsiHhIrsp
	 VjtAmeMwpzY+dmxB/KHI6wV2blreZRjxQaq2jOJ57N8Bn1tDZC3V3icPQ3n8M0hsnlRxA
	 WAu2FGAG1E3KPSRBn7XSGDwjbQGZavuX+9KOviUaJG0UAluvolQL2FXtTaw8zaStZy0nJ
	 AwYODm4+U5yKQbrJmqanXxpzbEt25Noa/z6jE69Mlf2CtIogpBCGSrCHqO0+hWQJx6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0pvB+LE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Nq8/7Ueo";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB26606A326
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 21:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB26606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R0pvB+LE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nq8/7Ueo
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJugcG2827644
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 21:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=; b=R0pvB+LESdxz4WbL
	dbApRq0mOJpWAyZSdyKwhZUFbXhlI3BR78EenLBPW/Iz1cFc0RKpzpBKTl/j5Qav
	lyRNVnsplbBV+3+Js+PFaWmpzbOnCWZxpTOiIQJtx58U0Khqh56tu0v6Zj9TFtw9
	L2s+VmH4pSUMIe7vxnqRNNgU2uPnOfh9MEk5DOQf2HCBL4T33SoOzTayPpLcWhTH
	9pUlxSbZgaJNU2dOobce7/334mgr5geNuWJNdSI32ERuLLH716U3dUodUIpxMqJg
	7k4z9g1lLYpi4BtXslEWTDuByDP+Ux+otZhRcbz7/3gY7MXbtdXPWvHvGlROdeyk
	PiCddA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3rq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 21:37:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3899514c88.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 13:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469819; x=1796074619; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
        b=Nq8/7UeoD+Haqt59X2BhRf96s21aYTqPxymZCsB0UpSCiicyKBfzjvMyqOeUwtMQG+
         2kUVaqF8T+hYgzKiBrWcgkR7X+pGimkT4wxTo//ijdibQwR02ty4klPBwC0a5akI4A0T
         cVc0XwN4LNfcTdzxmdivI/vTPFxxkLXJQo+LAaU7K33lNPx36x9zduP89oSWG27XN1tf
         S92FgxoZpF0b90oi5N5Vma0zRGByi5bkEMLr77i+bTDtlwT3avPQEkmLWZZCTw9rsLtl
         LbacxF99bUpcGIyLBrOWDJKoNO/k9sSyWH6uTBt0aRflds4By7i++twP7+/JtYoUul7g
         GH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469819; x=1796074619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgHcQ6hVCrK3pQvuLdcyazrN9FghjE4nbTNGDRYcMbg=;
        b=BEPpnxiUnoc4gZsgkAWLwzJjpxah2ssO7zHo+ZYhhzvLEo4Y7GDx/VhT+x5fVI2FyK
         VHw5UCPbTClQtbR523Sr89hJhX/VEZv5aSG0Yo2O7Y8ypBAJrZFtGF2kvPRLQq5EFG3q
         rbj0Ytq4OBvGBR6V42y/eFkNPFEcU2JXRb1424JQGj/NP3sA3833xXee56yK5SFmd7QV
         ADcvgmrg62yCGhN2m4hmQTOyobsxwDJOuhs3aNa9OWgSxSYZQbQstSFO2TJaEUfAdePu
         YWhF5ZE5FS4ilBAptSJ2MMFFj/dRWItslaHo1REc0o50Pa+IJlJSUeWhUA5/Xrc4iCcB
         xFmQ==
X-Gm-Message-State: APuU4Z9EIL+sc9bXzFhNIHIbKj1RtIGZj9yYPQTPtijQPZDBwzw+RhFX
	IgGmuhKa3WNUF9O3XXP9mNI/pBiF8Ci2CWybRw+PMaSAXxvg0DgJb/WpG24M46EUlyv3e2lyeOi
	DK2kdMVkvFuJp4e+QCJ21cn4iz4yXo9jx4ZLAqydOxFJz4prJXXnGHT2UrNXxDbTn3GhcpcblUX
	X7sD8=
X-Gm-Gg: AZFdTZfekINj7mguBg38l4prNP7G5Q3J5la6/JfEqMuewKf4BPaxWaJtHZF224CQ4IU
	MTWJJc6IB/xn0D06ow3lsPEF2le9eedD2vL8N0mJgTFltdtIQssVlzwB3GvRoN0vXcFPynfA+R/
	0vK12rHczuEuffD6xmXIWP9qYDFABSmjyZNnzEBX9yDMPId7cVSxwavLYj1Mj0J5U/zfQXlD+iz
	o2xbtVYRofVbQuudmE+2H1LHomJiitzsCNjV5EV9uwMjRh1nnpH1pwpFuaAHDtcyob0AOM4S93P
	nlq5jODvgbOENNjibD35mZdC8zIu9RO+bEML3En6HzRIA0+eYErmX+ffigcs9S3MeXUS7zEfHEL
	oNh2Ex8RnWy/c8rmkJAKHJj4mIG4bTiclrQ7xHqVf0SQoePf+7V452wyt+svejgxC63NLzHbB6H
	pdeVw=
X-Received: by 2002:a05:701b:4287:10b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b556925d65mr13386174c88.35.1795469819365;
        Mon, 23 Nov 2026 13:36:59 -0800 (PST)
X-Received: by 2002:a05:701b:4287:10b0:144:fd7c:84fe with SMTP id a92af1059eb24-1b556925d65mr13386135c88.35.1795469818715;
        Mon, 23 Nov 2026 13:36:58 -0800 (PST)
Received: from [192.168.1.136] ([172.88.17.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm29552288c88.3.2026.11.23.13.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:36:58 -0800 (PST)
Message-ID: <6ef26d63-6416-4935-b379-942b9787926f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:36:57 -0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/7] usb: misc: qcom_eud: add per-path role switch
 support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-5-elson.serrao@oss.qualcomm.com>
 <sashiko-outbox-229887@kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-229887@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04b1fc cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=p3NwzfejtmCMKWTc25r7/Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZiEXcGR3oAm6HCNq-lwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: DlwKX9lY4WG6V4wgcx0Blo07gSDaxmgj
X-Proofpoint-GUID: DlwKX9lY4WG6V4wgcx0Blo07gSDaxmgj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX7AONoDAJEL4q
 yP2kFAsmH/T2oQ5RQeaHlH4dafTA0OWisrzUpSIpNLGbRU0LNI6vbPXF948WM+/Hf3AMFM482i6
 E483BUoojUxvpDmn31i/C0LBp981ofo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX4rnu8nkJx4VB
 gWqcQM+yoEiP/jY+wtDEX3Xj2RGyVDCYQEePpWvQWCciL/vqQBIKDCgIYbUCzbfhMnKcLKl1gq9
 e5d6oixDLSFr/HQA952wzdGgAhWxlYCmpcsYUACumgWb5WfJ4Wqztuou3lV6D0Vu4eHaOzWBNMt
 fczrMa13RiQhs02FJ3+MAYMA7VvYZ/9tHxSqP4waqZXwygFvxAZ5TqorhangihVV8A7t5RuXffr
 nITqHuiVn20BLBD53hpixKcU8sNW4elss0ZucnHs1oOjk7JmSsvLzZ/2DmrlObw+vN6ira2aqeW
 ERJwWYgX6iybSoDNUZq6XjbfYA48YrAc1t+BSZUVEmSFH3to4q7kbiHrwl8MyZsVMDfauem6KL8
 aLt9yBEVdklW4cdqzgiu8BcoVlG4akA+ZHw4ek1pFDS/PHC+64PjshLojAw/18pvqUxwzWkivSv
 Pjqd1rYSXRsZx8TlWOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086



On 11/23/2026 10:56 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] usb: misc: qcom_eud: infinite probe deferral and wrong fwnode
>   in eud_init_path()
> --
> 
> commit 9854aac37e71428a22eccd3000ca7589c021cc4d
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add per-path role switch support
> 
> This commit replaces the chip-level USB role switch with per-path role
> switches that relay role changes from each USB connector to its
> corresponding USB controller.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index a3afa3bb93481..48e474bdf818c 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
> [ ... ]

[...]
>> +	role_sw_desc.fwnode = of_fwnode_handle(path->np);
>> +	role_sw_desc.set = eud_role_switch_set;
>> +	role_sw_desc.driver_data = path;
>> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
>> +	role_sw_desc.name = path->name;
>> +
>> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
> 
> [Severity: High]
> As reported by Konrad Dybcio on v9 [1], will eud_init_path() defer probe
> forever when a controller omits dr_mode (or sets it to "otg") without a
> usb-role-switch property?
> 
> When a DWC3 node omits both dr_mode and usb-role-switch (such as
> usb_2_dwc3 on SM8350), dwc3_get_dr_mode() falls back to
> USB_DR_MODE_PERIPHERAL at runtime and dwc3_drd_init() never registers a
> usb_role_switch:
> 
> drivers/usb/dwc3/core.c:dwc3_get_dr_mode() {
>     ...
> 		if (mode == USB_DR_MODE_OTG && !dwc->edev &&
> 		    (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
> 		     !device_property_read_bool(dwc->dev, "usb-role-switch")) &&
> 		    !DWC3_VER_IS_PRIOR(DWC3, 330A))
> 			mode = USB_DR_MODE_PERIPHERAL;
>     ...
> }
> 
> Because eud_init_path() only checks for explicit "host" and "peripheral"
> strings before calling usb_role_switch_find_by_fwnode(), eud_probe() will
> fail permanently with -EPROBE_DEFER on any board with such a path.
> 
This corner case was discussed during the v9 review. The consensus was
that EUD is expected to be used with dual-role capable controllers,
while support for controllers that resolve to a fixed role at runtime
can be addressed as a follow-up improvement.
Link to this discussion: https://lore.kernel.org/all/23131f02-0df2-4875-a409-b9c9340d0dd7@oss.qualcomm.com/


> Also, when np is the legacy "ports" child node (handled earlier in
> eud_init_path()), setting role_sw_desc.fwnode to
> of_fwnode_handle(path->np) registers path->eud_sw on the "ports" node,
> which of_fwnode_graph_get_port_parent() skips in favor of the parent EUD
> device node during usb_role_switch_get() lookup, so the connector can
> never resolve path->eud_sw.
> 
The legacy `ports` binding does not describe EUD as a connector-facing
role switch. It does not define a `usb-role-switch` property on either
the EUD node or its `ports` container. As EUD is not marked as
role-switch capable, the connector never attempts to resolve a role switch [1].
Therefore, the described lookup scenario does not apply to the legacy binding.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/roles/class.c?h=v7.4-rc4#n131

Thanks
Elson
