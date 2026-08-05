Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D30379C47
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939645; cv=none; b=LnHSCSA1wghNi2IG4PcU+HswnTntrssmEXFjdS7MBxnAUE+VPuN3qWsIC31Y6lTWCgSb6s47p5TOnyeUi6v1fG5ID7HBFz/FCPXTkgkOVqPeewKujqdzoCqvdX6RnrDrxp+oldLxy3+8TuPJ5gn2amcjHtQ/6nWNK/TSvP64I6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939645; c=relaxed/simple;
	bh=4Y0tFjjA0/7z8h3f3x8tgdl7HewpEz7kO9BZNVLeTik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OzKQgHe3M8OH6F+TQhtw5ew0rg0BHCboXd/GA/Jp4swxpc+mEwQEq8fEsAlcghniw5HYjk1lktNnuh7H8BqMM2z+e9PyXkg45Z24yRrY3qMuy8RP8ofSBWmZB9nJ3xq8cgqql8oHwIt1oP6ZK5wu7u8ON9tLUA3xbnybpElEKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIUOaSr2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrAsx2ep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIUOaSr2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrAsx2ep"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHCY92707845
	for <sashiko-reviews@lists.linux.dev>; Wed, 5 Aug 2026 14:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFnhszp0nvBl6qh+eKSVvt6CGsw40dTVojjJ48+8wsU=; b=XIUOaSr220OU6sEl
	oFqJscrEwmf8fskI08lCvteTcLYJ8X2usLIbEo6VRpP0o9sWfD0VjnrW1xIyHKhY
	4HiN/eHN/DLAxAMWw3yn2UZfhB5TOxD9PoI4dmZxIdphBUYGqyFuDyR8vKLbJSYA
	+Wtwu3LOnaBBqiGIXXC/6RwYmCxkM23JFMe/JDH3LNOHauhY4KRjZUy3eQd49B9f
	+3+FXznM6DRuvZNENfeAT3nAIdixJpzKTVsUnItaH/uJfDgvHWfH7vurOnehHnOo
	NeswxPM2bJD8JHPaN35PlcStAjdTZ/Tvvg0ktbJ5ApzfmcakKI940KjHpura1yT7
	T7nn9Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5gavq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 14:20:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1093391a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785939637; x=1786544437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFnhszp0nvBl6qh+eKSVvt6CGsw40dTVojjJ48+8wsU=;
        b=FrAsx2ep34QwwTElcXai0lQSk9JUEs5pM8kQZYQCJ3I/g2sZNc1Oqk6dyb5KEjI2wT
         iXFAZt91oZrl3gErAKkfSXKeUz9cOCt7xO9jZS6tx4foheSC3kkq00tgLg9xd8ZYe6ry
         lDtfhE8+EvT3/YtcP57T2ZZjs+VgXyQRNu9bAXtmaRDmMmy505yq6AMzQPiOF0VDs3YS
         wMkvJo7gpNwlThxrtRXIxij1A3VhuWc4vmYKG/2em/580E54YRdY0t3McUqF4Gk7VVNc
         sfhdszYWRQKQGem7F4UDnCHivSZ8QNKC3W4vEpJifibucmUPXXZaCIkE5MFsaudO+Iby
         9oCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785939637; x=1786544437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFnhszp0nvBl6qh+eKSVvt6CGsw40dTVojjJ48+8wsU=;
        b=oAaPGTjMHSSqv6+ta56KRLEi9njsz9SpdYe0cLZkohadKOPaoi/lVUO4HpdISS9Iur
         I8/1THQcfLKIE3n8lyJoVh+33zFCKNJzOgh3ud8WyNEnbkDCbShHeGV9z+TU8aCphfu3
         0ClxycFwcLwQmBBg5Btg8DkDgcoAlE8YVEN90NKtYyg2W5Zotrh0t6k6rLmyPfF0Ev41
         ASDsIFDeYOy5qVQGSDEh967WJe6r+gInwAlNRjbNGNrfheIQuvUHz2fQw4zTYSsIJVYu
         UROvcMM6MiwzFmzwd85YHzxf1xtCm3TOmXGqiqtqoNxG02z827vlKltzGwelCz0IR/Nz
         OVWg==
X-Gm-Message-State: AOJu0YwRaqpNEljO/NMySPU6yybk+gyq5hdT2pEa2oQ5aBGOWEaX2BOF
	nXg7z0t5sWO73e/tWHb8EfK3HLZzmOoaSEhK7f2jp100g2Ya1Kp8+bgGytvgKfVLNOIxkqRyvrg
	xydBw12g0DjgxNyEV/ZhK0WeOrYdk/ZLVJviUSF7IBW1Zj4H+OqULlsaSClMmlkp0oA413PExH9
	J72nA=
X-Gm-Gg: AR+sD12zw9Ev5QDSiFsDL882Cp88Dx1hw4KycjlG8319WuW46Plr6gp237szJ5yuZTP
	qRoX9MStLzbi9kOxvYpsRBclh9EtX5g93JAMfU0GkrgR3B9Jobeq6Lea/mK8ap231YuqFzfp/7I
	lGpKx+dJ15DlEScX6PEfhgRoxiez+wqz6a+XI65KezA3+nmIZ3XTLFNuot0n9tb1nTw2cO20Ve4
	l3L0dpdI6ZZh/GqCnsVqY/ERKyyYhM2cTKl/rTEz6Tdb36J/zj+8ZjrufvkQWft7XZoNhjeK2sE
	N4bEyuY3JL0tBhSLU6I9/defBaqx2mVygZ5LY+Bd8rO+wtTnUX5+Z2Mk6hbh+bJAl7sMjt4/g0g
	8+y5hXhD7PHKVOOuu1J180KI=
X-Received: by 2002:a17:90a:e707:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-3903c65f978mr2895120a91.14.1785939637209;
        Wed, 05 Aug 2026 07:20:37 -0700 (PDT)
X-Received: by 2002:a17:90a:e707:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-3903c65f978mr2895082a91.14.1785939636705;
        Wed, 05 Aug 2026 07:20:36 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.80.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38feda512f3sm4894793a91.11.2026.08.05.07.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 07:20:35 -0700 (PDT)
Message-ID: <188cf07c-2b37-4079-885b-d1a675bb6328@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 19:50:31 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
 <20260728181442.A7CDC1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728181442.A7CDC1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExNSBTYWx0ZWRfX6/I1i2rFcD+x
 0PDA1ndqmUJlQvxmPVwZzmRPLOY+mWFuT3C/V0OfsmGXB0cSVknUswA0tj66JkkkK0v0hZ56vx4
 Bkj5t38mp8nTmw8xSW+w8LtYYEghqhkB0xNnWMxEMHzReUUKOP3POM5aREqUMZCxGxk0mDtgwTA
 SQ13DScd9Sy+MmsC8nHvK4K1PWWjsx2AL5tmQO/S30809bvjjN6JE8AFmM3GQSYCPZ42+mn+7tk
 r7swADgk47SrUVua9TFbfSN7u5pBBBpkRcySBomhQuj9BeK9tq50MUMxbZQeDzZNnJAY2vNlB59
 5Gy8NQSAWgERTo3CAibwfTahLdXmV24Z22E8ZC2RfISAy9q7aSYg5WROYg4JPxFzfI0WPMSdrkz
 qiK7dv/qJVhD5gF85VYX3MYvDFUOqexG/vyfg9V4BAYeaHfGZWOP8lCAWV/StLoL86iQ1QyHk7S
 NPyXFIYeMd1fNyEXlJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExNSBTYWx0ZWRfXwYgT+4CU4BtT
 eAK8KWzgDPqKkKKTcNvgwuveEkqbMdUE9KMoH9y9j1SYuKU2YZI4u5dI9clc6M8B6mkKdBkGekX
 YqXNWtZpa4mJfiRiRB3x/1ggu40HD1M=
X-Proofpoint-GUID: T1t9Z758QhSYyzjvWseuzFaUoNkJBDt7
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a7346b5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=UcsMPGGDBby+oECK+wqMZw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8FJe9Coq-pJ3FNODzwIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: T1t9Z758QhSYyzjvWseuzFaUoNkJBDt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050115



On 7/28/2026 11:44 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The IRQ handler is requested and SCI events are enabled before the `ec->ec_cdev` array is allocated, creating a race condition that can lead to a NULL pointer dereference during `qcom_ec_probe()`.
> --
> 
> --- Patch [5]: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C adapter functionality ---
> commit a6f49e31946f2ee0f2b44aae1db005b085a4d77b
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> platform: arm64: qcom-hamoa-ec: Verify required I2C adapter functionality
> 
> Check the underlying I2C adapter supports both the raw I2C transfers
> used by the fan RPM/LUT commands and the SMBus byte and block-write
> transfers used by the other EC commands, and fail probe early with a
> clear error if it doesn't.
> 
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index d0c45d9970eee..a420a180a1948 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  	unsigned int i;
>>  	int ret;
>>  
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
>> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
>> +		return -EOPNOTSUPP;
>> +
>>  	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>>  	if (!ec)
>>  		return -ENOMEM;
> [Severity: High]
> Could this regression result in a race condition where the interrupt handler is
> requested and sci events are enabled before the ec->ec_cdev array is
> allocated?
> 
> If an interrupt fires immediately after devm_request_threaded_irq() and
> qcom_ec_sci_evt_control(dev, true) enable it, the handler could execute:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_irq()
>   -> qcom_ec_restore_fan_state()
>     -> queues ec->fan_calib_work
> 
> The asynchronous workqueue function would then run:
> 
> drivers/platform/arm64/qcom-hamoa-ec.c:qcom_ec_fan_calib_work_fn() {
>     ...
>     ret = qcom_ec_fan_calibrate(ec, &ec->ec_cdev[i]);
>     ...
> }
> 
> If devm_kcalloc() hasn't yet allocated the ec->ec_cdev array later in
> qcom_ec_probe(), couldn't this cause a null pointer dereference when
> qcom_ec_fan_calibrate() accesses ec_cdev->parent_dev?
>

I'll move the ec_cdev allocation earlier in probe, before the IRQ is
requested and SCI events are enabled, so there's no window for the
handler to fire before it's ready.

-- 
Best Regards,
Anvesh

