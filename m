Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580D3DCD9C
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328038; cv=none; b=J726A6ek9ys6kK+c0DMcgwdPgMQPH6grV5hWRkLlrecRnpZxUQpW667SgQNSPwQZJybV5uEhSXIHPkvnw5hSUFG7CVfgushS1ErdMA100TOZT/gOk+9PL9fCLy9k8A0i8pgUcn6DaTrS/CUBLrrEkm0chZSWQAYxMqciKkpxhkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328038; c=relaxed/simple;
	bh=rGoAurEoLA1pXl7F+SSgjSYQ9FrcIc5baVLYJPGEd/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEHmZ5hQnYkDfKEjOvdw2XpZ3GMe4OEAoPt8wrEHJmleE4PSfO7y4ESyNuZmZU5Hzuzpi2AUpywjzxC7GyMJ7dKpHaUuuCWzGd7O96IHiExu+K5i4M8vD95k983JUyRa4me0cCBDVVq32rr/daCJFo5V1sH5ttn+2znXGjw1+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eF3B3xgU; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF3B3xgU"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec49f7e35eso194717366b.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328033; x=1780932833; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8VgCm9XB5VMkj9oTgzpT73+TANb1YKCvjZzDgyzRqo=;
        b=eF3B3xgUQMikluKZi3mHLnkIa7hQuvWMjTcDg+aPFH2RvZuTap2fNyFEfFP8VRjeU7
         oP4GJCAkL7mvpKzEUXg2wDZX6ByRUuwkXouoRgVr8TLcdE8qZP0RdLYIcGnmV9tiw/My
         86vs3X9VqOyt6kbvuWSx/stVsVbM4fSfSM5edSxIiKRsXBfBfAkPlsCUYn+jk69Myydl
         rYYHe0USy8GMgzNa0M3JyogYCwwupgtWOio+C9w+RZCiIsrvAh7YOtpq8llFDpfqGuZy
         ykY/dSTCyL4DufcFtBpu9nxQUHLmesrqHOUe5XhYOxqTQY/uKreoiIkMAQhWdqWZNScV
         hBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328033; x=1780932833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8VgCm9XB5VMkj9oTgzpT73+TANb1YKCvjZzDgyzRqo=;
        b=iQciMaS5TU/Nwgm38oGaDLhyIrK9NHbmz5/vn+SeeIdNAryAylPqo8B4hPhyefL3LL
         D3H977VcPyJS3//OcXSVPZj0SthBbrNwoqDgEbWSRfzX9ySQDTtjkkNkTgLrMLEuYWSI
         7bGvr0dWNjclaXM59UwY5hEJYZhR3tPbGN40NI8tocsM0EXxie8lrtfIucyL12bC3mDv
         EI/2YuDrG15duD+mJSdOBcms2SyH0hh53cVvJod3IjriWxqYYT1ZMbK9K3GEq1JwQIqC
         jdUGOae02j8VF+nfxGpdmcqsfBn4tv5q8OUYWn460h0y90h/6RJumjWQ/2YgFwcYAueX
         Pt7w==
X-Gm-Message-State: AOJu0YxHD3ehGhmZYN6DFYkFRijcuUpoA5dOjS1d93FicyqdqvawSlOt
	TvetSjLA1JXv7I6FqJ6tQ5CeJ9ZxUXfGF3lsnSTrkhcEOj+5FS4ikNB1WlqFRmV+
X-Gm-Gg: Acq92OFOVyyX/7IBb+LdRLm846ARzGDaZ8I8xGnThHBxNkl9Yc67KWQvt4n9U+RuAdE
	+CnmhuIZn8MN2iN8d2etwd/6aR9mwicAWza2AGEGJ/cvXeHKtiF+N5FHX3xq8B2TyCCjU3+K1y3
	jRIEajJeOw5MpTedQjafax9nF1n1fIj7/UXP9IrVAG6p9dfgzxlMLCBKd4deVHLFzDBCv1Dl4f4
	LrGLKYVD74WiRupSbS1nbWs/pH5EsBZrcn6afP0yaOsZgysxvIPKfyXdCsKy4vdxFrcfYx+++J6
	2gwhf+rcKo3x+GjkCesyp9axLbZQVE/5SC27dCYftS3G0N9z3CODZkd5hiYX3N8nayLFstJs0t8
	2szf/WWxHQshltFaZDcnm5cNrhJ282CZYYnUYgwIYNsva3Du2n+NY/CyfBROyoj553VN7v5YjHQ
	sl2y9amAZk87wTEGMDQXiNjH0VWR6fcSvjMGxb+3MxY5xfFbRkoHv/2No9zt9CftMbB6M9
X-Received: by 2002:a17:906:9fc8:b0:ba1:1181:b773 with SMTP id a640c23a62f3a-beaafceff43mr619978166b.10.1780328032881;
        Mon, 01 Jun 2026 08:33:52 -0700 (PDT)
Received: from [192.168.1.30] (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee94d11126sm43162366b.27.2026.06.01.08.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 08:33:52 -0700 (PDT)
Message-ID: <4198bedb-807e-4330-9172-f12928d446a8@gmail.com>
Date: Mon, 1 Jun 2026 17:33:51 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260601150752.666393-3-zstaseg@gmail.com>
 <20260601151907.AD44F1F00A1B@smtp.kernel.org>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <20260601151907.AD44F1F00A1B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/26 5:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The SBU port in the USB-C connector node has a mismatched unit-address and reg property (`port@2` with `reg = <1>`).
> - [Low] Invalid 'mem-type' property in the ramoops node.
> --
> 
> commit 444192d5f33eb93dfce53fe410ae77991af6102e
> Author: Stanislav Zaikin <zstaseg@gmail.com>
> 
> arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
> 
> This commit adds devicetree support for the Xiaomi 12 Lite 5G handset,
> including display, touchscreen, UFS, buttons, regulators, remote
> processors, and USB device mode.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
>> new file mode 100644
>> index 0000000000000..ec795f8adc467
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> [ ... ]
> 
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg = <1>;
> 
> [Severity: Medium]
> Is this port index correct for the SBU endpoint? The devicetree specification
> requires the unit-address (@2) to match the first address in the reg property.
> 
> Additionally, the usb-connector binding assigns fixed indices to ports:
> reg = <0> for High Speed, reg = <1> for SuperSpeed, and reg = <2> for SBU.
> Using reg = <1> here for the SBU port violates the schema and might logically
> miswire the SBU mux to the SuperSpeed data graph port index, breaking
> alternate mode routing. It will also generate a dtc unit_address_vs_reg
> mismatch warning.

Right, sorry, forgot to run CHECK_DTBS=1 before sending this time. Will 
fix in v9.

> 
>> +		cdsp_mem: cdsp@9c700000 {
>> +			reg = <0x0 0x9c700000 0x0 0x1e00000>;
>> +			no-map;
>> +		};
>> +
>> +		ramoops@a9000000 {
>> +			compatible = "ramoops";
>> +			reg = <0x0 0xa9000000 0x0 0x200000>;
>> +			mem-type = <2>;
> 
> [Severity: Low]
> Does this mem-type property pass upstream validation? This appears to be a
> downstream addition historically used to force memory caching attributes,
> which is not supported by the upstream ramoops bindings.
> 
> Leaving this in will trigger a dtbs_check validation failure. Upstream
> typically handles memory attributes via standard reserved-memory properties
> like no-map.

This one passes dtbs check.

Another thing that it complains about - memory-region for ipa node but 
this relies on Dmitry's patch [0]

[0] - 
https://lore.kernel.org/all/20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com/

-- 
Best regards,
Stanislav
