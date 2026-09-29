Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3874B95B6
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721953; cv=none; b=rhGIkJL5cZGqzp9OZII7uJzNio0xY6zkuHRoS1ulhoWShqo4l+FssyVmwxsRdIG3uDA67MwMgBEp12Ua6b43HMB1nZxVwZrc3LvzVg36vm1J2yk1wZuzoT7lZsYf0397M+5Ij/uXm/iNG3JrLpYz7VVjWmZzBcstn8atZahR4+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721953; c=relaxed/simple;
	bh=dC53LB+tIJFwEpceDreJ+RnbTcm3iaaALK9p28NVu4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdl4VfabxrUg1UK+VWD4jGNM0UxCL2xoZnK2hyAztocDK0W8YFR7WMmY6cU6odqFtQYHcPZ7UTtXiRGWS4UPeu9J7UQHGkIRr9OSRhVGlts0ra9TU0sOXSbqxNVQr5ebT07H/y6KYPIpTaIMtwMCcSNR3GyB3am1M6YuQD/w6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpqiyVvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ce2WxhDs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpqiyVvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ce2WxhDs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THTmQX826667
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 22:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9tUdSvBhFwcPlNjWWhSdnpDZcx71N739YvfqPdVz7o=; b=dpqiyVvt/BaQ/8U7
	1/+1TgOtWsB4hQB98r6Jum0eHhnMlJIIXTrKIUHauRl5yKyWr6nH7Fd0N1c58biR
	CNSlKzyahQOcwW00nHjT+d6GeJYdLZ8Q00cFg5NuqGcT2v8dmGMvZgp9mz1rR2OZ
	93Ynafr9GH4nexu9FatkL2UIgjRTJLyFpiI6FhinDrrv/aiMMUBUIl3Jv5SdvdaY
	xvbQ6CeKlnlOCOpy8+kWeE76Rqo9P0m7nze7G+VQGk/wZrRfOV0XJeUBCv/JKslT
	3hVKDZD7rOYS29mXIxNC1XWEHavwtYjK2wOZamKIeaO98A5z6AQ4sNZhYGRb7Rs+
	5YbYQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh156m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 22:45:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso3052671eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 15:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790721948; x=1791326748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9tUdSvBhFwcPlNjWWhSdnpDZcx71N739YvfqPdVz7o=;
        b=ce2WxhDsJLPtOmm+ExzFCwO7qtnUxjRr0Vf8xJTXg9VIxf1BlThk4+RAVSZdb9z0Iz
         KR/1KoscSrvQuAVwfSnDT202uehDMcC2uqIu+wmoCtpu4J+LPhqTQhZK4Xl1gw43rYz6
         V+sydR+8Jx0AsfO1ioHiH+wTdakcKRSDn5z/og6DitA4u3Ta9w3gaDaxI7mib8uHrbEF
         PHhK5wsRYRnCgm36chgYj645H1maPEiHiDmVn9F0v5slodonmkKv8kWIRFGF02tS+d75
         GYjMo6UarH/8npnGhuR21jijrJEtTxHonjc5v1RMmPd4neiZRe4uvMGqvXsSjeHIwHvL
         dT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790721948; x=1791326748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9tUdSvBhFwcPlNjWWhSdnpDZcx71N739YvfqPdVz7o=;
        b=xdxXhcrQGtRfWXVdWIdXwmbkQOZioXyEsIVUixvOYyoPZtyULRTjGF0FOJzO3nt2DS
         5LrWcL/+uK9H0BnqtzENUawc6++rGKtS0ObP+frMNAEIqgctc9rQnbQ6A4kgp+0jXF4+
         k6IG6aHE+FzkmamrrHTy+g3gO/XU2/MuKffjpb7FXc0QSA1rUH/LKWtOUP/juLe0Czc8
         wQeyEABVQ4dNCXHo7ELZ1JYERWAAzToMQRPn5oI3y3n6b8fougIKFpJK7lAekDmPRMtm
         2N5aic4uezNe9xkxnd27tduN8y9lM/KNyTT1QlmlmyrfHmBimybHZ7DxP6Qno37qTEn4
         6iNQ==
X-Gm-Message-State: AFq9FYItjJOHzdFPOYJUDAqnm4g4MHmS7XDvPCVP3Pv4s53YeBUh59lQ
	ke4dNdKZrT0a1AigZnM2q2nPFpBjc/uj84o5jUXuyvSaCLEfA38rvIAQ8Su+hmtzEFIHAjYBh47
	7jMCf4Ti7/EAU9epTF0hXI335l6cetJu2c3oL5Z6pnPP1yJM4Xl/lwCz6NLYfj1NxXuGzzfj76X
	JyX5Y=
X-Gm-Gg: AYBFou1S87eIkvDozsKbdvvfmfbWfe3Va7iIrf8Ni/u9Y5VCY2ibKp2hbc50BWxGXdu
	H2sWYTy8csguQ8dTu1PzcMqOSPmPN/YMRBjKyUuIgLa/P/9UbQQZwLNwSlokfWfrQ6Tv+2iyfLO
	ODakOCPi5yC9Ne5IPaXaYtb+ilGOKUSeXZNdqBp8mnjqp7R4/pN0ZKJapmy3YlFrUzwKXbM/fY3
	jBIhTcceQaM5xkJ2KFPVi4tnIgNp6GeYi0SKadzVhJuXtLORoKOm5jZqM7vjnbtG0xm+0xtrPdo
	CB76JpgmH+DpLbrNNJCGPOVVakMcJSyXh9wHRgbslA64yJ8zRG3a9HPXilMg0ZsM0wJlMx/lUEt
	S4ahxek8IA9fuc+ZBpoB3KoX9ouW6Yj3UAsx/GFSDQyd7zl8rCj7oNBFF
X-Received: by 2002:a05:693c:8382:10b0:34b:7e89:99d with SMTP id 5a478bee46e88-34c6558b73bmr961198eec.36.1790721947842;
        Tue, 29 Sep 2026 15:45:47 -0700 (PDT)
X-Received: by 2002:a05:693c:8382:10b0:34b:7e89:99d with SMTP id 5a478bee46e88-34c6558b73bmr961173eec.36.1790721947241;
        Tue, 29 Sep 2026 15:45:47 -0700 (PDT)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c350be57bsm2775146eec.1.2026.09.29.15.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 15:45:45 -0700 (PDT)
Message-ID: <547e3087-cf24-4071-a9e1-5740113fe613@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:45:45 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
 <20260929214304.E1BDF1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260929214304.E1BDF1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfX91koPr2bw6dn
 QyjI5w1CZES29Fvw8M5EnRce7EXwv8k1KN8ROw3YZCESQ74yLNCj3kdTQ0TmsvYhPWYsEvGKjMX
 VmzpLv3nY2kmDEJaFUz1Dg7hrA/2X/XGdkXAjIaIzHDdCNMhtpybFG9fpI0W0cj2Q/370gGixTm
 qd/xw+y19i+/N5svJzChPRCGCqZJZoY+WOIRIJZpiVVVl3lGOC8OuQPJBenDl368M9n06bdSSpJ
 ERXqmN9yK5rE1qpbKD1tGFyGQk2JFhYQhmwQKLfwnInC+/XqmJ9eqnJykny49ZbVEI+UHSNXxFI
 ofenzZlZLCHUCEgo1E8VJjCEr6T8pF7wusr6R28wolPYj1nDPQlUGipcM2h39YH3d2N/0HeSQ8k
 qc8Mp7gs+p08NTB0xiTcpcWhkdAkKkp6D9En18st+O6AWp1GCcDXfq64VlR5GpEgjb8RYcEVPXX
 uFJp7BXKCO8j67IbFog==
X-Proofpoint-GUID: 3Py1MbGIsZkG_fVBQHoXxkkqBxGBGxUQ
X-Proofpoint-ORIG-GUID: 3Py1MbGIsZkG_fVBQHoXxkkqBxGBGxUQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfX2TRBL5MplG+B
 hdcy4dwtfuRzSc0+UEj1ACgL3308SqTEIoxK33TtSGTYKBqBKizpS+6QbBnWbTIymk3a/STpvtc
 cgz1H7TDqNd08lTiuF7L3s5OCtR99pc=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abc3f9c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h59PC-ZenUpd4ZM43B4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290090



On 9/29/2026 2:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] usb: qcom_eud: uninitialized software state blocks disabling EUD on boot
> --
> 
> commit 16556b4a5664eacf6eb75fc1fe5031d31c087dc0
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: improve enable_store API
> 
> This commit adds a state check in enable_store() to skip redundant hardware
> operations when the EUD is already in the desired state. It also improves
> error handling and logging when enabling or disabling the EUD.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index 48e474bdf818c..e227d05cfecd4 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
> [ ... ]
>> @@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> +	/* Skip operation if already in desired state */
>> +	if (chip->enabled == enable)
>> +		return count;
> 
> [Severity: Medium]
> Will this early exit prevent users from disabling the hardware if the
> bootloader left the EUD enabled?
> 

A bootloader-enabled EUD has never been supported; the driver has
always assumed EUD is disabled at probe. Supporting it would need more
than syncing chip->enabled from the register. The driver would also have
to take the PHY votes and bring the role-switch state into line for the
active path. That is a separate feature and outside the scope of this
series.

Thanks
Elson

> Since eud_probe() initializes chip->enabled to false (typically via
> devm_kzalloc), it does not verify or synchronize the software state with
> the actual hardware state by reading the hardware control registers (e.g.,
> EUD_REG_CSR_EUD_EN).
> 
> If the bootloader leaves the EUD enabled, the hardware is active but
> chip->enabled is false.
> 
> If a user then writes 0 to the sysfs attribute to explicitly disable the
> EUD, this check evaluates to true (false == false) and returns early.
> 
> This bypasses the disable_eud() hardware routine, preventing the hardware
> from being disabled and potentially impacting power consumption or role
> switching.
> 
