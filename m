Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099924;
	b=MetX1ZIJlQ+ZqDazzL0Kq1aYtqbt7Dn8cilN7MgkaPj7fsghaaakk+dW7Wr+EoAJXg2U
	 KIgo3QchiGyoTaXlvohXGxA2BKM+Rx4sMuvM3iKbo7+GtUzzWSRL66wGdcXM+CCu/x7N7
	 tmPP063Z+zbtrHzRkmIHvu2SLk1cuQRW3K5JDHvc6kQ/e1fg/00Wc8qsrdwW1nBrVN9Gd
	 FXcMg1d+/pTitc7UgMISpSXEqgySwdhyaNBMaw5Fqkw2js7reqk0pJFtI9Ee4ROXf7o4G
	 4wzV/62ykOm5+ozfdUxHeryh1ZcbaQWoVlFWqkZQ/AohN0G3xhRdkXkMqZ8VhC0hqng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kioM/dIQhf9xOllfSUwXHJLd2zfmSwYQMvb9vLExFjw=;
	b=fbmEQB074qvI/ObM+Ek5XWiaFnPtBGi3TZ8buoRKmlysa+3jFXIOpL+uu0jB83goUtg5
	 ZIMaswOxKwU0q7AU951G9mU3SLs3z0ypvRX9k8bR50H3WcDcb6/EkuJLthHxaf0DPznZf
	 0pbaTFanyAVwBo8HFR6f6ohY/f7Z1kaU+GKs1Gk0B/qS39pBmWwJrAyrEMFQ0Q2ismcKo
	 QCLG9Qwf1zz5sCQ8HMRyGQ54pdEHtuGMJLnKV0md6UO9F4oBtyGGT46SucZMRPoltd7NL
	 D2dW9ECH/BZk/Jv34tPvyKYvdp9iA3/KdRo9+ZQI7YJd/v/94ohXS6/5FFlO0PMM6dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKuI5Lgr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZG6poumM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5533606BAAC
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5533606BAAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKuI5Lgr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZG6poumM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjxG22609246
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kioM/dIQhf9xOllfSUwXHJLd2zfmSwYQMvb9vLExFjw=; b=ZKuI5LgrAivtM+jq
	tEGKvvgNs7Q78EWhgj/K+x3A85JbVQPkClTw108BV7skv1uWKKK/WVf+gQRNQI/O
	Lucu9iLfksPEKe/xDD3Qi+DdBW3r1yrTNpAeg2V+9xmYk4RkIu7kqCp8IzX+jQKQ
	7ci5QkdOx5JVcQ6GIKQKIboWzCX0aZMEibb5ThVVeZr/QsIfkaEx3EGlCugkL3oq
	xMTe2sDEfh7Pn+3jgRQkttTjkiqkK+WKou+syuDOGkmhM5+j74Y+QSKfH/MdUbsj
	mwvbItQURr2lk1bgkLlKGv1r/XNzy49Hx1+fC04E9fVlvKpJfIPnWELXMT+Zf5AT
	J8i6yg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcvv06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:52:01 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso1856335c88.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 06:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795099921; x=1795704721; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kioM/dIQhf9xOllfSUwXHJLd2zfmSwYQMvb9vLExFjw=;
        b=ZG6poumMK4Q4yjPoUoaKn8Onya/kqpjnQy6llcBydu2RhtdPTrSihX1GWXiehae0Wr
         BolebIzLcrcQBVTEekhBPkthIy6O0lDFkZvus8nt6ccTfJM0cB+v0LibfVXUe+s+VQGO
         J56tvvaEw//tygFWowGarOwRfJmNQhIRRMdLp0a8eDFX8Pv5sjg5zME1GrdcZTxii5WX
         Qh/bUAnVrwU9dGmOUJrD0LSdxp5jktQrEG++ZqC/2j9lGetvajY0tX9PZN8h4/0ZBrLj
         B4GySo4zwt8bljPgYYBloCzjtB/3uChCM/I2NDX+VW0DYrCgJd4GPP2fEPPUrLdWhm7v
         iGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099921; x=1795704721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kioM/dIQhf9xOllfSUwXHJLd2zfmSwYQMvb9vLExFjw=;
        b=tJtZ9RJLjAXMd5XYW3kyNIKLvtleEIf2zeTdK1s+InfyKFNCjhNqohty4fiuS4MvOb
         gvNUH+g0MkO814dx6HO7CKla98Vj8QBloNj4ZUNNpX1tjndCXlRA9hgk/VdoKOZHQNaz
         QJ01R21EQmwRNaXZUl9CwCB2j6p6dVtFb8dnaQA+GdOxIwawOD41DQPTaX8xttHAHHRS
         xlSxyTRoEurDiL/30O1JNmpvMTvc7sJ+8knxrdeNwS8ueF8z/qHyR9idodJzOWi2yoUa
         SamABiOFiN5rnVyVaGEt0hpc9VjTe0oXiumLX8oumIrICHfyRVdDLC7N0nZmVX9Fm9EU
         ff0A==
X-Gm-Message-State: APuU4Z9xJVJBho44tySLUDjrqgqVT+lUBAyLgstOzXNgzXa6SCND+lCB
	MyKXp9mnJ4dH7h5wHwRCwCi22WwLS3x73cQVpVXk/BTT+Z2LeI/U595ENwIAwfvfmWxewYmKNWx
	oUHC5RUHqjetr9n8kCn9mGioMZov16pESg6e9F7wnNJqjRIIQZRQkgmiGPJ3zLRswaIvGqhNBaT
	I8DQ8=
X-Gm-Gg: AYBFou1Ss5gbHe1absuU3lZtyuH0ttvWnTnVMeDyZ0iYQVH64e5U0EzN7hbY41Ex5ct
	2dCcK5TwRKtydB6+dGqh+vHFEF1Gpugt3vCjjdnk0YjwAaGMOjbgiVZ4tvGqN4nmV3CK1v1NGGW
	aASBHnmWFbR4nff4p+PCaVTL0+qQEiOgoAVYa0Rpepx+1vRAgmSI05yZoyZGOBpCqaPUlECZsVS
	UJ0MjY+/ILUFY0QKazrpUbTBZsXJh8cTpQqHelVFsbRrXnW6xIr7/H7ms0QQmkqq8sofhBqZvn9
	0bx9aLNpnIhi9AgGYkXe2yWxradkCUW78d3vxm7ZEPeGmmydXXSOdy6exZpaTxNGkAh7yaSCmSL
	xk9MKnu2VuNf7VeP9x+RPS3Rz3fPLQSi+vwpGuzYDCtu88RW9I0TbUI30KrZWuaFC339gfjg=
X-Received: by 2002:a05:701b:21c5:b0:1b5:3616:59a1 with SMTP id a92af1059eb24-1b543cf2aadmr5400296c88.8.1795099920892;
        Thu, 19 Nov 2026 06:52:00 -0800 (PST)
X-Received: by 2002:a05:701b:21c5:b0:1b5:3616:59a1 with SMTP id a92af1059eb24-1b543cf2aadmr5400265c88.8.1795099920093;
        Thu, 19 Nov 2026 06:52:00 -0800 (PST)
Received: from [192.168.1.8] ([171.76.86.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm14551950c88.14.2026.11.19.06.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:51:59 -0800 (PST)
Message-ID: <b11c917f-dd4b-4fe8-b6a9-b88efe5405c2@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 20:21:56 +0530
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
Subject: Re: [PATCH v3 2/4] remoteproc: qcom: pas: Support secondary images
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
 <20261118-oob-support-glymur-v3-2-2cbdfe208d56@oss.qualcomm.com>
 <sashiko-outbox-221390@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-221390@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6aff0d12 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=87ZocSFwOvG5wiH9gxK4QQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BwgVlTpjipEpg46IzBkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: v2-8MFB7xh8zmNJjrjfSYgjcF-yX_hzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX6zHwYrKPlWky
 cXVJcT638UDEW3ZD+pNrlePWzzhdWDpXg3at04dZ05ym61OPXbgG/OXI52Zh5FCSNLq2fMu0l/E
 SV8YkkkqSvCyZZAOhKLgRIYaGrMOqARIhj++g4On+l1HW/9MRkQpXXhYHrwOMjI/lWeVJAn8Up5
 dRTD9MUVgQNVRtofw25JIKRr5vizMuTAzl04ndgBK7bPWphKV43ut7Dos7DEvWtbBEiAbGng+QT
 CKEHrUC3duDYz4dT4QlWISYf58NhhsyCjLR1w0sYJ39KgO7JMPxZd38+WuDtRllKyObeL3W2iks
 Iyh5Sk7y552LM2kYOlggah0cR615c4DCh948mpGUbKMJfwXnIE1TQWhC12Fl+5lQIPfBR6V+htN
 o9F43cSnzgx3oHrYeID5LbAG2LmRo/fwVskvj3M39GMdRBc55d25zcOipdAszaRlQfuZZQHwjSo
 RFEwGnkFO3+x2h/RzCA==
X-Proofpoint-GUID: v2-8MFB7xh8zmNJjrjfSYgjcF-yX_hzO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX/9rwyQj6/mo6
 xwDY5SnK458WqrwXOfHNJkkUYH/0rHEx5Mna4Ob0aTt8TyNasM/brKYKTGracIulcpPrt9RSv9U
 afIoUJASJ51MjU2hZSuLBxecKbYc9sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190059



On 11/18/2026 9:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] remoteproc: qcom: pas: masked secondary shutdown errors in
>   qcom_pas_stop()
> - [Medium] remoteproc: qcom: pas: unauthenticated PAS shutdown in
>   qcom_pas_start()
> - [Medium] remoteproc: qcom: pas: firmware leak on boot failure after
>   qcom_pas_load()
> --
> 
> commit f4e5bc32dd6dbd8e248f2fc47b7078b505ef5dfc
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> remoteproc: qcom: pas: Support secondary images
> 
> This commit adds PAS remoteproc support for loading, authenticating,
> mapping, shutting down, and releasing a secondary image and its DTB.
> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index e7dfad27e5263..1c8c0c22c34d1 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> 
> [ ... ]
> 
>> @@ -252,6 +288,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  
>>  	return 0;
>>  }
>> @@ -269,19 +309,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>>  	if (pas->lite_dtb_pas_id)
>>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
>>  
>> -	if (pas->dtb_pas_id) {
>> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = request_firmware(&pas->secondary_dtb_firmware,
>> +				       pas->secondary_dtb_firmware_name, pas->dev);
>>  		if (ret) {
>> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
>> -				pas->dtb_firmware_name, ret);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>> +	}
>>  
>> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +	if (pas->secondary_pas_id) {
>> +		ret = request_firmware(&pas->secondary_firmware,
>> +				       pas->secondary_firmware_name, pas->dev);
>> +		if (ret) {
>> +			qcom_pas_release_firmware(pas);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (pas->dtb_pas_id) {
>> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
>> +				       pas->dev);
>>  		if (ret) {
>> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -			release_firmware(pas->dtb_firmware);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>>  	}
> 
> [Severity: Medium]
> Can this leak pas->secondary_dtb_firmware, pas->secondary_firmware, and
> pas->dtb_firmware if boot fails after qcom_pas_load() succeeds?
> 
> qcom_pas_release_firmware() is only called in qcom_pas_start() on success
> or under the disable_irqs error label.  If rproc_prepare_subdevices()
> fails in rproc_start() before rproc->ops->start() is reached, or if
> qcom_q6v5_prepare() fails at the top of qcom_pas_start() and returns early,
> none of those firmware objects are released and pas->firmware is not
> cleared.  A later boot or recovery attempt will then overwrite those
> pointers in qcom_pas_load().
> 
> Calling qcom_pas_release_firmware(pas) and clearing pas->firmware in
> qcom_pas_unprepare() (or jumping to the cleanup path when
> qcom_q6v5_prepare() fails) would avoid the leak.
>

All firmware handles share this gap if startup fails before cleanup and
it is pre-existing. This has to be handledd seperately.

>> @@ -338,10 +388,51 @@ static int qcom_pas_start(struct rproc *rproc)
>>  			goto disable_cx_supply;
>>  	}
>>  
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
>> +					pas->secondary_dtb_firmware,
>> +					pas->secondary_dtb_firmware_name,
>> +					&pas->secondary_dtb_mem_reloc);
>> +		if (ret)
>> +			goto release_secondary_dtb_metadata;
>> +
>> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					    pas->secondary_dtb_mem_size);
>> +		if (ret)
>> +			goto release_secondary_dtb_metadata;
>> +
>> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
>> +		if (ret)
>> +			goto unmap_secondary_dtb_carveout;
>> +	}
>> +
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
>> +					pas->secondary_firmware,
>> +					pas->secondary_firmware_name,
>> +					&pas->secondary_mem_reloc);
>> +		if (ret)
>> +			goto release_secondary_metadata;
>> +
>> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
>> +					    pas->secondary_mem_size);
>> +		if (ret)
>> +			goto release_secondary_metadata;
>> +
>> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
>> +		if (ret)
>> +			goto unmap_secondary_carveout;
>> +	}
>> +
>>  	if (pas->dtb_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> +					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +		if (ret)
>> +			goto release_dtb_metadata;
>> +
>>  		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>>  		if (ret)
>> -			goto disable_px_supply;
>> +			goto release_dtb_metadata;
>>  
>>  		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>>  		if (ret) {
>> @@ -372,13 +463,17 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(pas->dev, "start timed out\n");
>> -		qcom_pas_shutdown(pas->pas_id);
>>  		goto unmap_carveout;
>>  	}
>>  
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>> +	qcom_pas_release_firmware(pas);
>>  
>>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>>  	pas->firmware = NULL;
>> @@ -386,16 +481,37 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	return 0;
>>  
>>  unmap_carveout:
>> +	qcom_pas_shutdown(pas->pas_id);
>>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>  release_pas_metadata:
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>> -	if (pas->dtb_pas_id)
>> -		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -
>>  unmap_dtb_carveout:
>> +	if (pas->dtb_pas_id) {
>> +		qcom_pas_shutdown(pas->dtb_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
>> +					pas->dtb_mem_size);
>> +	}
>> +release_dtb_metadata:
>>  	if (pas->dtb_pas_id)
>> -		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>> -disable_px_supply:
>> +		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +unmap_secondary_carveout:
>> +	if (pas->secondary_pas_id) {
>> +		qcom_pas_shutdown(pas->secondary_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
>> +					pas->secondary_mem_size);
>> +	}
>> +release_secondary_metadata:
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +unmap_secondary_dtb_carveout:
>> +	if (pas->secondary_dtb_pas_id) {
>> +		qcom_pas_shutdown(pas->secondary_dtb_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					pas->secondary_dtb_mem_size);
>> +	}
>> +release_secondary_dtb_metadata:
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
> 
> [Severity: Medium]
> Does jumping to the unmap_*_carveout labels when
> qcom_pas_prepare_and_auth_reset() fails call qcom_pas_shutdown() on a PAS
> context that failed authentication?
> 
> Each image maps its carveout before calling
> qcom_pas_prepare_and_auth_reset(), and on failure jumps to its own
> unmap_*_carveout label, which now executes qcom_pas_shutdown() before
> qcom_pas_unmap_carveout().  That issues an unbalanced PAS shutdown call to
> TrustZone for an image that was never authenticated or brought out of
> reset.  Separating the shutdown labels from the unmap_*_carveout labels
> would ensure qcom_pas_shutdown() is only called for PAS IDs whose
> qcom_pas_prepare_and_auth_reset() succeeded.
>

Agreed, I will separate shutdown from unmapping so failed authentication
skips shutdown. while previously authenticated PASes are shut down
before their carveouts are unmapped.

>> @@ -440,9 +557,30 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  	if (ret == -ETIMEDOUT)
>>  		dev_err(pas->dev, "timed out on wait\n");
>>  
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_pas_shutdown(pas->secondary_pas_id);
>> +		if (ret && pas->decrypt_shutdown)
>> +			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
>> +		if (ret)
>> +			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
>> +
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
>> +					pas->secondary_mem_size);
>> +	}
>> +
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
>> +		if (ret)
>> +			dev_err(pas->dev,
>> +				"failed to shutdown secondary dtb: %d\n", ret);
>> +
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					pas->secondary_dtb_mem_size);
>> +	}
>> +
>>  	ret = qcom_pas_shutdown(pas->pas_id);
>>  	if (ret && pas->decrypt_shutdown)
>> -		ret = qcom_pas_shutdown_poll_decrypt(pas);
>> +		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
>>  
>>  	if (ret)
>>  		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
> 
> [Severity: Medium]
> Won't `ret = qcom_pas_shutdown(pas->pas_id)` overwrite any error returned
> when shutting down pas->secondary_pas_id or pas->secondary_dtb_pas_id?
> 
> If secondary PAS shutdown fails in TrustZone while the primary PAS shutdown
> succeeds, qcom_pas_stop() returns 0 to rproc_stop().  During crash recovery
> in rproc_boot_recovery(), a zero return from rproc_stop() lets execution
> proceed to rproc->ops->coredump() while the secondary memory region is
> still locked by TrustZone, whereas pas->dtb_pas_id below uses a separate
> variable to preserve earlier shutdown errors.
>

The existing error handling in qcom_pas_stop() can mask shutdown
failures, We need to address this separately.

-- 
Best Regards,
Anvesh

