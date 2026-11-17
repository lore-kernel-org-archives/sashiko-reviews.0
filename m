Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908862;
	b=eceBRaeDwa3qVuPP5DrOx7kpVN0P48jRSXnkI79I+2ElzENFg42Q53yvxKHysl6u14Q8
	 ypV11Vw+W69ooeNLRMT1Ki6lXqK3/MB0GNw0U2hMLgdkiHDBtOusrcSFChAbrk7cztNg1
	 n6o2DnpawgyfcxaGdlkufTveZ+T4kSuKUVivUjuoN0B9c0gNVvE1/79eX6+XsBBeZt1Pk
	 LJ6Ey/TgAK/VP9wBMdgSi1Hd71A3kViGQVDZDfWgTUgHSpAs1oyV5ZktvfjuT5yrtjUmL
	 bcZakYTm0dC2yF5X7y4VNroyZ12HTCD6TlaqkbPPEyn2MdGN3vNkWUBGuqHY5XQPm/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uJuSXrPeczlKoYl4Gdw6NYbQ8b5iEnp2xPj5hpFEwEo=;
	b=gvKZNPnoHUk/dbOlSWEKhrcBjB2qn/M3wFaAuKHu2PcMCDBJtS9T+TxgWBie01wwZwr/
	 95bdxRGs2WQZJyti60omx1Ogxls1pCaZI9QbNcI137e+PyEQACtPPrjkwcSOeVocxJJ2E
	 3BbrmYd1CvLEx17+ZHNnTSrtb9Xg2tdrC55YdziRTPKDDw/30ISLaAKLhDA1Vhejd0lPq
	 bfV99BJO1iEy8kfQm5FRb1DJBze/UBahsklYRgciFJuc3c41m3UxM7EL8VzI3yDtXHw0M
	 jr7B4phLmR+l+ek/ma8X6rWSrqNaEYe9v9GX0CvxPC3enpWwjuxaNRrwh3tVX/HK+sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blZ8ZwC0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMWa8YB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38B606A32C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 09:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D38B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blZ8ZwC0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XdMWa8YB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53GtA3458198
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 09:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJuSXrPeczlKoYl4Gdw6NYbQ8b5iEnp2xPj5hpFEwEo=; b=blZ8ZwC0SDtxIgGJ
	I1qE9SzbcGmP90LzxBVInkxYIGk5MeskbFIwoniW6Zd8eewiuvua3+r1+pbHKneI
	kfNzYEZjNtxTmwikl1yi7Udw90d9N/i6um6MRo5OhH1jKXy1BfeAJlZXbU9cf7PZ
	hp4FgFjenrhLHbttqPNVj+4m8P+EDkZS5CTi9GTWxlfuWrFubbsNhABjuXP7uR3l
	Hea+6cRZcn9FXBPB3ZSMT/JO18SFquS0YlMtfZeu8oC7ORIn6IbZc21qGT/Pl4Zm
	JQnKtzLMyMUISQsmIrr25uqBP2T09Oa88onvB1w67MgKA06RKMD/Ffc5Sc/KQ8+k
	2RNojQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh92ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 09:47:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea0fe07201so28822295ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908859; x=1795513659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJuSXrPeczlKoYl4Gdw6NYbQ8b5iEnp2xPj5hpFEwEo=;
        b=XdMWa8YB+ah/Q0lNDUtEqtVFVbPFGg+A4wbDeNqzMBQcOYNWLST4nUNJPdH4YnHCL5
         OHr96A+MC8/dCuIeMxM2Kd+3kTgoMUffQxem4Codw6WBzKbyw1izoivXL7rv1EEnlRw2
         is5Ju1Rd6dMxQOo/YK782exnpDSNyDJsATe13TUT5CVS7BOguXufzlLjn6jeCQt4YaGF
         +XpCCxMCclOz1grjdJ4pOqdGO5jlljsjTealw8gBPr5IlL4nYVCm4VswyLsojnCJex6F
         IMvCLPXu6saq1bsIX43Sg87N3oTFAKDHnmwuSi1PNUrtNzmYlkIYyvagnr4JGaHPQEzH
         GMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908859; x=1795513659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJuSXrPeczlKoYl4Gdw6NYbQ8b5iEnp2xPj5hpFEwEo=;
        b=OOOat92ZW5eI6TqKjRh7vJtxBxYeXRfIhKCw1rj7iSfEKqR5K+9FJ3xeRuXHFvy74b
         A1tG2f+MYtJDgNtlsjcFgaQidneRM+tc/W1CcFYH9vcCWekvrErtXOIhI+jOI+Ike25T
         6k/6ccYsht+kkDkeSsnLx9vl4Ducj+6Fa37yxLxMSq0A9Qk4RLWdh0ML44HzDfT6qWZX
         XqJFMQdbm56jH2/14FQTS/b0GgbzJb4XjpS86YoB7KTVnz3Oz2YjubsSBPZVSfZvDlDA
         WQX1l6mbg3/PmTY33FXk6rSCwFsgoAZK5KoUXZqlYgHddha8RDNWy3KPIRsQD5w7rvFe
         wDLg==
X-Gm-Message-State: APuU4Z+iZXcfoO60v6hM8+WXAa6R7j8BtnXw7mE3q0c0fcU8pVk0cY2G
	tWwov10il56E5VfgasyBRfJm9FrZQF4uXk4YM4sdUH+2urRA14Lnv1fL/O/R+7OHDsCIemi4Y5l
	chCcitLfyL4Z5FHnxZRszARaQHwuDP/R40WMVo26NZ7kNUAVLg3SvYaL1G57O2dpULRcv/3u9r4
	zDsREHPA==
X-Gm-Gg: AZFdTZfDRoaaiM9GxBgPMc/oLD/PQKohPAQiJXXlLIHjyVUoj3LilTweYZ8IMp4rA31
	yvqhBRglfmSKMJN7778at4gZD17VUvkyurhk9kY2WTv9GAluqWknGNNFT0qke86nVeueU2HMT4f
	QilexBDdsv0/5qwTfRKMXDeP5CZyjgjtpTDWUAhsTTyMeJ8UF+r+jXjfV4NRjHFs2XVy9de9khb
	A06JYNvs9imsfTwUhRoHke5FW9Ell4DbEqOsuTYafgw2h7fcpBu0kE7l5mZK0RzpI1ZJLu/KZcr
	nm5BpnNXs0q5Oqq2JuAKU30JDJaDmDE+ciewHABrIdvkvtn8eIf7R0HxME6wvgIaeYJxPZPcKvv
	etmIQZf2iaHi5ss0/asK7Aku/gU5DTkAWDEQkDB5UZFER4Rlr91nVAlkGjQqAALwVvNIJJCXvEp
	rFyl+gjwSQtanDE6L08UPTXWxJgWOphnhBpUZ0dA==
X-Received: by 2002:a17:903:1a8d:b0:2ef:e044:290c with SMTP id d9443c01a7336-2efe044297bmr13398635ad.25.1794908858764;
        Tue, 17 Nov 2026 01:47:38 -0800 (PST)
X-Received: by 2002:a17:903:1a8d:b0:2ef:e044:290c with SMTP id d9443c01a7336-2efe044297bmr13398275ad.25.1794908858052;
        Tue, 17 Nov 2026 01:47:38 -0800 (PST)
Received: from [10.133.33.75] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe6d032f3sm3798995ad.38.2026.11.17.01.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:47:37 -0800 (PST)
Message-ID: <ad4a58c4-ebec-413a-a2e2-734f27a04a5c@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 17:47:35 +0800
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
Subject: Re: [PATCH v22 7/8] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
 <20261110-enable-byte-cntr-for-ctcu-v22-7-05d48c0eb110@oss.qualcomm.com>
 <sashiko-outbox-206158@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-206158@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1mAK3GehBrU5uSCpIAal5Ji_XRwkQtoE
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afc22bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=K0rlx_LeU6MIbl2n6VwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 1mAK3GehBrU5uSCpIAal5Ji_XRwkQtoE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX+iW9+H+UEhYk
 oDKVYwMyN1P6tbkhTPyAu8fJiXP7IpKE1lJHxyhZ+nIOLpOrUVDM49+/04ppzgBPNQf04XGAv3h
 HTZZgLgQQuskxbPnBPx5w9LoD2MWrb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfXzeyyIhaGqUrY
 fHCLNmwDDCXHxK9yatZC6VqhOod2IhJn3N4wyc2bqaTvtoxU6hMQUxXRGqfelBsHwVmi++yCrx6
 skNGrUvd+gej5544Ur+6bgwTTptLNjpwqzPRjnIIIU8r8OxVp7kqla4FcndbrIE8TKXudGy/0v4
 h9N2bo6S2Ss+gf4N86zoNRYunpfxxk8uTYYWF5VQu15C1Rnv1s4NiLTQN3tGUtXl5mXV8DJ5z3m
 gB/BO+bHM9yfpyRSad81KoxCCWc+hbAjsh+77FEerUZaKICKvWc1qh4Sj6nHAIWEqW8c7K6/hAu
 ZK46vS1ThsfNHefZrs509yzTfny/v8wUucJsws+DRIySP5AT85x5/tpyPBXf2mrqkH/88PHN9Jv
 KmVEkDhvlPjxF2pfxRZltxMNr9sG9dDh7eGjfviVBRSaxidwnV2agAEbLH32Eyng5bm2rAM2oCO
 wsRtN5/+0yN0gIuV4Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170038



On 11/10/2026 11:59 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential
> issues to consider:

I have addressed the valid Sashiko comments in next version.

> - [Medium] coresight: ctcu: unsynchronized concurrent read() in
>    tmc_byte_cntr_get_data()
> - [Medium] coresight: ctcu: state desynchronization in
>    ctcu_byte_cntr_start() and stop()
> - [Medium] coresight: tmc: broken ETR_MODE_RESRV fallback in
>    tmc_read_prepare_etr()
> - [Medium] coresight: tmc: tmc_read() converts byte-cntr negative errors
>    into EOF
> - [Medium] coresight: ctcu: BYTECNTRVAL register not reset in
>    ctcu_platform_remove()
> - [Medium] coresight: ctcu: UAF race between byte_cntr_sysfs_ops and
>    CTCU teardown
> - [Medium] coresight: ctcu: byte-cntr state desync on generic read
>    fallback and unprepare
> --
> 
> commit a4fb3ce63a75e273453b0d77a16ba13d3f857042
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> coresight: ctcu: enable byte-cntr for TMC ETR devices
> 
> This commit adds CTCU byte-counter interrupt support for TMC ETR sinks so
> trace data can be transferred from rotating ETR buffers to userspace while
> tracing is active.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> new file mode 100644
>> index 0000000000000..56a9aa2f693ab
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> [ ... ]
>> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
>> +						 struct coresight_device *etr)
>> +{
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	struct ctcu_drvdata *drvdata;
>> +	int port;
>> +
>> +	/* The ETR may not be connected to a CTCU device */
>> +	if (!ctcu)
>> +		return NULL;
>> +
>> +	drvdata = dev_get_drvdata(ctcu->dev.parent);
>> +	port = coresight_get_in_port(etr, ctcu);
>> +	if (port < 0 || port >= ETR_MAX_NUM)
>> +		return NULL;
>> +
>> +	byte_cntr_data = &drvdata->byte_cntr_data[port];
>> +	/* The port is not initialized by ctcu_byte_cntr_init() */
>> +	if (!byte_cntr_data->ctcu_drvdata)
>> +		return NULL;
>> +
>> +	return byte_cntr_data;
>> +}
> 
> [Severity: Medium]
> Can an in-flight byte_cntr_sysfs_ops call race with ctcu_platform_remove()
> and cause a use-after-free of ctcu, ctcu->pdata, or drvdata?
> 
> tmc_read_prepare_etr(), tmc_etr_get_sysfs_trace(), and
> tmc_read_unprepare_etr() load byte_cntr_sysfs_ops with READ_ONCE() and call
> into coresight-ctcu without holding a lock or pinning the CTCU device.
> Because session_done is initialized as completed and is only reinitialized
> after tmc_read_prepare_byte_cntr() looks up ctcu and byte_cntr_data (and
> remains completed throughout generic ETR sysfs reads), ctcu_platform_remove()
> does not wait for callers that have already loaded byte_cntr_sysfs_ops:
> 
> CPU0                                  CPU1
> tmc_read_prepare_etr()
>    ops = READ_ONCE(byte_cntr_sysfs_ops)
>    ops->read_prepare(drvdata)
>      ctcu = tmc_etr_get_ctcu_device()
>                                        ctcu_platform_remove()
>                                          wait_for_completion(&session_done)
>                                          ctcu_byte_cntr_put_ops(drvdata)
>                                          ctcu_remove(pdev)
>                                            coresight_unregister(csdev)
>      ctcu_get_byte_cntr(ctcu, ...)
>        coresight_get_in_port(etr, ctcu)  <-- use-after-free
> 
> If a second CTCU device is present, ctcu_byte_cntr_put_ops() does not clear
> byte_cntr_sysfs_ops at all when the first CTCU is removed.

Two CTCUs: by design. byte_cntr_sysfs_ops is one shared, stateless ops 
table registered by the first CTCU and dropped with the last one
(byte_cntr_ops_users). Every callback resolves its own CTCU and port 
from the ETR, so keeping the pointer while another CTCU is alive is correct.

BTW, we may have two CTCUs platform in the future, but not now.

> 
>> +
>> +/*
>> + * ctcu_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
>> + * The byte-cntr reading work reads data from the deactivated and filled buffer.
>> + * The read operation waits for a buffer to become available, either filled or
>> + * upon timeout, and then reads trace data from the synced buffer.
>> + */
>> +static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
>> +				      size_t len, char **bufpp)
>> +{
>> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
>> +	struct device *dev = &etr_drvdata->csdev->dev;
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	struct etr_buf *sysfs_buf;
>> +	atomic_t *irq_cnt;
>> +	ssize_t actual;
>> +	int ret;
>> +
>> +	/* No byte-cntr read session, let the caller use the generic read */
>> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
>> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
>> +	    !byte_cntr_data->reading)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * A zero-length read must not be treated as the end of the buffer,
>> +	 * otherwise the unread data of the current buffer would be dropped.
>> +	 */
>> +	if (!len)
>> +		return 0;
>> +
>> +	irq_cnt = &byte_cntr_data->irq_cnt;
>> +
>> +wait_buffer:
>> +	if (!byte_cntr_data->buf_node) {
>> +		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
>> +				(atomic_read(irq_cnt) >= MAX_IRQ_CNT - 1) ||
>> +				!byte_cntr_data->enable,
>> +				BYTE_CNTR_TIMEOUT);
>> +		if (ret < 0)
>> +			return ret;
>> +		/*
>> +		 * The current etr_buf is almost full or timeout is triggered,
>> +		 * so switch the buffer and mark the switched buffer as reading.
>> +		 */
>> +		if (byte_cntr_data->enable) {
>> +			byte_cntr_data->buf_node =
>> +				tmc_etr_switch_buf_node(etr_drvdata);
>> +			if (!byte_cntr_data->buf_node) {
>> +				/*
>> +				 * The sink has stopped, let the generic read
>> +				 * handle the last etr_buf.
>> +				 */
>> +				if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
>> +					return 0;
>> +
>> +				dev_err(dev, "Switch buffer failed for the byte-cntr\n");
>> +				return -ENOMEM;
>> +			}
>> +
>> +			/*
>> +			 * Get the interrupt count of the switched out etr_buf
>> +			 * and reset it for the next etr_buf.
>> +			 */
>> +			if (atomic_xchg(irq_cnt, 0) >= MAX_IRQ_CNT)
>> +				dev_warn(dev, "Data overwrite happened\n");
>> +		} else {
>> +			/*
>> +			 * The CTCU device is removed while the sink is still
>> +			 * running. The generic read can't be used then as the
>> +			 * buffer in use is not synced yet, end the reading.
>> +			 */
>> +			if (READ_ONCE(byte_cntr_data->removing) &&
>> +			    coresight_get_mode(etr_drvdata->csdev) == CS_MODE_SYSFS)
>> +				return -ENODEV;
>> +
>> +			/* Exit byte-cntr reading */
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	pos = byte_cntr_data->buf_node->pos;
>> +	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
>> +	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
>> +	if (actual <= 0) {
>> +		/* Reset buf_node upon reading is finished or failed */
>> +		byte_cntr_data->buf_node->reading = false;
>> +		byte_cntr_data->buf_node = NULL;
>> +
>> +		/*
>> +		 * Nothing in the buffer, waiting for the next buffer
>> +		 * to be filled.
>> +		 */
>> +		if (actual == 0)
>> +			goto wait_buffer;
>> +	}
>> +
>> +	return actual;
>> +}
> 
> [Severity: Medium]
> Can concurrent read() calls on the same open /dev/tmc_etrX file descriptor
> race on byte_cntr_data->buf_node and cause a NULL pointer dereference?
> 
> /dev/tmc_etrX is a character device opened with nonseekable_open(), so VFS
> does not serialize concurrent read() calls with file->f_pos_lock.  While
> byte_cntr_data->reading prevents a second open(), two threads sharing one
> open file descriptor can enter tmc_byte_cntr_get_data() concurrently:
> 
> CPU0                                  CPU1
> tmc_byte_cntr_get_data()              tmc_byte_cntr_get_data()
>    if (!byte_cntr_data->buf_node)        if (!byte_cntr_data->buf_node)
>      wait_event_interruptible_timeout()    wait_event_interruptible_timeout()
>      buf_node = tmc_etr_switch_buf_node()
>                                            buf_node = tmc_etr_switch_buf_node()
>                                            /* returns NULL: no free node */
>                                            return -ENOMEM;
>    pos = byte_cntr_data->buf_node->pos;  <-- NULL pointer dereference
> 
> Similarly, while one reader is in copy_to_user() in tmc_read() before
> tmc_etr_update_buf_node_pos(), a second reader can reach the end of the
> buffer, clear buf_node->reading, and call tmc_etr_switch_buf_node() to
> restart ETR DMA into the buffer still being copied to userspace.
> 

Fixed in next verison.

The readers of one port are serialized with a per-port mutex.
Interleaved reads of one fd can't give a meaningful trace anyway, the 
lock only protects the driver state (buf_node).

>> +
>> +static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
>> +{
>> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	unsigned long flags;
>> +	int ret = 0;
> [ ... ]
>> +	reinit_completion(&byte_cntr_data->session_done);
>> +	byte_cntr_data->reading = true;
>> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +
>> +	/* Setup an available etr_buf_list for byte-cntr */
>> +	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
>> +	if (ret)
>> +		goto err_reading;
> 
> [Severity: Medium]
> What happens if the ETR is in ETR_MODE_RESRV when byte-cntr is enabled, or
> if a second open() races with an active fallback read session?
> 
> ctcu_byte_cntr_start() does not reject ETR_MODE_RESRV, so
> tmc_create_etr_buf_list() returns -EINVAL.  tmc_read_prepare_etr() treats
> -EINVAL from read_prepare() as meaning byte-cntr is not configured and falls
> back to the generic sysfs read path, calling __tmc_etr_disable_hw() and
> setting drvdata->reading = true while byte_cntr_data->enable and
> byte_cntr_data->irq_enabled remain true.
> 
> Because tmc_read_prepare_byte_cntr() sets byte_cntr_data->reading = true
> before tmc_create_etr_buf_list() allocates a node and checks
> drvdata->reading, a subsequent open() during that fallback read session
> briefly sets byte_cntr_data->reading = true.  A concurrent read() in the
> first session then enters tmc_byte_cntr_get_data() instead of reading
> drvdata->sysfs_buf and fails with -ENOMEM because etr_buf_list is empty.
> 

Fixed in next version.

ctcu_byte_cntr_start() doesn't start byte-cntr for the reserved
mode, and read_prepare() returns -EBUSY when a generic read session is 
in progress, so byte_cntr_data->reading is not set temporarily.

> [ ... ]
>> +static int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
>> +{
>> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	/*
>> +	 * Do the unprepare operation only when the byte_cntr_data->reading
>> +	 * is truly set
>> +	 */
>> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
>> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled ||
>> +	    !byte_cntr_data->reading)
>> +		return -EINVAL;
>> +
>> +	tmc_clean_etr_buf_list(etr_drvdata);
>> +
>> +	/* disable_irq_wake() may sleep on slow-bus irqchips, call it unlocked */
>> +	disable_irq_wake(byte_cntr_data->irq);
>> +
>> +	/*
>> +	 * The byte-cntr register is not accessed here: the trace path, which
>> +	 * keeps the CTCU powered, may have been released already. It is reset
>> +	 * when the path is disabled.
>> +	 */
>> +	scoped_guard(raw_spinlock_irqsave, &byte_cntr_data->spin_lock) {
>> +		byte_cntr_data->buf_node = NULL;
>> +		byte_cntr_data->reading = false;
> 
> [Severity: Medium]
> Does clearing etr_buf_list before clearing byte_cntr_data->reading allow a
> new trace session to start with byte-cntr skipped?
> 
> ctcu_byte_cntr_start() skips enabling byte-cntr when
> byte_cntr_data->reading is set, relying on tmc_enable_etr_sink_sysfs() to
> fail with -EBUSY while etr_buf_list is non-empty.  Because
> tmc_read_unprepare_byte_cntr() empties etr_buf_list and calls
> disable_irq_wake() before clearing byte_cntr_data->reading, a concurrent
> trace enable in that window sees byte_cntr_data->reading == true in
> ctcu_byte_cntr_start() and an empty etr_buf_list in
> tmc_enable_etr_sink_sysfs(), starting the trace without byte-cntr.

No change. The window only makes one trace run without byte-cntr (it 
uses the generic read), no data is lost. Clearing reading first would 
let ctcu_platform_remove() free byte_cntr_data while read_unprepare() 
still uses it.

> 
>> +		/*
>> +		 * Complete the session with reading cleared in one critical
>> +		 * section, so that a new session can't start in between.
>> +		 * ctcu_platform_remove() may free byte_cntr_data after this,
>> +		 * don't use it anymore.
>> +		 */
>> +		complete_all(&byte_cntr_data->session_done);
>> +	}
>> +
>> +	module_put(THIS_MODULE);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct tmc_sysfs_ops byte_cntr_sysfs_ops = {
>> +	.read_prepare	= tmc_read_prepare_byte_cntr,
>> +	.read_unprepare	= tmc_read_unprepare_byte_cntr,
>> +	.get_trace_data	= tmc_byte_cntr_get_data,
>> +};
>> +
>> +/* Start the byte-cntr function when the path is enabled. */
>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +	struct coresight_device *sink = coresight_get_sink(path);
>> +	struct tmc_drvdata *etr_drvdata;
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	byte_cntr_data = ctcu_get_byte_cntr(csdev, sink);
>> +	if (!byte_cntr_data)
>> +		return;
>> +
>> +	etr_drvdata = dev_get_drvdata(sink->dev.parent);
>> +	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>> +	/*
>> +	 * Don't start byte-cntr function when irq_enabled is not set, when the
>> +	 * CTCU device is being removed, or when the read of the previous trace
>> +	 * is still in progress: the sink can't be enabled until it is finished.
>> +	 */
>> +	if (!byte_cntr_data->irq_enabled || byte_cntr_data->removing ||
>> +	    byte_cntr_data->reading)
>> +		return;
>> +
>> +	/*
>> +	 * Don't touch the count and the threshold if the byte-cntr is already
>> +	 * started by another path of the same sink, as the buffer_size may have
>> +	 * been changed since then while the etr_buf in use is not.
>> +	 */
>> +	if (byte_cntr_data->enable)
>> +		return;
>> +
>> +	/* A new trace starts with an empty etr_buf */
>> +	atomic_set(&byte_cntr_data->irq_cnt, 0);
>> +
>> +	/*
>> +	 * Configure the byte-cntr register to enable IRQ while the path is
>> +	 * enabled, the CTCU is powered then. The configured size is 5% of the
>> +	 * buffer_size.
>> +	 */
>> +	ctcu_cfg_byte_cntr_reg(byte_cntr_data->ctcu_drvdata,
>> +			       etr_drvdata->size / MAX_IRQ_CNT,
>> +			       byte_cntr_data->irq_ctrl_offset);
>> +	byte_cntr_data->enable = true;
>> +}
>> +
>> +/* Stop the byte-cntr function when the path is disabled. */
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +	struct coresight_device *sink = coresight_get_sink(path);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
>> +		return;
> 
> [Severity: Medium]
> Can byte_cntr_data->irq_enabled, byte_cntr_data->enable, and the ETR sink
> state get out of sync across start, read prepare, and stop?
> 
> The ABI documentation states that changing irq_enabled while tracing does
> not start or stop byte-cntr for the running trace, but irq_enabled_store()
> only checks byte_cntr_data[port].reading:
> 
> 1. If a trace is started with irq_enabled == 1 and irq_enabled is set to 0
>     before opening /dev/tmc_etrX, tmc_read_prepare_byte_cntr() sees
>     !byte_cntr_data->irq_enabled and returns -EINVAL.  tmc_read_prepare_etr()
>     then falls back to the generic read and stops the ETR while
>     byte_cntr_data->enable and the IRQCTRL register remain active.
> 

irq_enabled can't be changed while byte-cntr is running (-EBUSY), so the
generic read can't be forced on an armed byte-cntr.

> 2. If a first path starts tracing on the ETR with irq_enabled == 0, and
>     irq_enabled is then set to 1 before a second path to the same ETR is
>     enabled, ctcu_byte_cntr_start() only checks byte_cntr_data->enable (not
>     whether the sink is already active) and starts byte-cntr mid-trace using
>     etr_drvdata->size.  If enabling a later component on that second path
>     fails, ctcu_byte_cntr_stop() sees coresight_get_mode(sink) == CS_MODE_SYSFS
>     from the first path and returns without undoing byte_cntr_data->enable or
>     zeroing irq_ctrl_offset.
> 

ctcu_byte_cntr_start() only starts byte-cntr with the first path of a
sink (it checks the sink mode), so a later path can't arm it on a 
running sink, and a failure of that path can't leak the enable flag.

> 3. If a fallback generic read is open (etr_drvdata->reading == true) when
>     the trace path is disabled, tmc_disable_etr_sink() returns -EBUSY and
>     leaves the sink mode as CS_MODE_SYSFS, so ctcu_byte_cntr_stop() returns
>     early without disabling irq_ctrl_offset or clearing byte_cntr_data->enable
>     before the path is released.
> 

No need fix.

When tmc_disable_etr_sink() returns -EBUSY because a
generic read is open, the sink stays in the sysfs mode and 
tmc_read_unprepare_etr() restarts the ETR afterwards, so the byte-cntr 
state matches the sink state. The next real disable clears it.

>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index 739105acb0a13..564ecc5ad5153 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> [ ... ]
>> @@ -244,10 +355,59 @@ static int ctcu_platform_probe(struct platform_device *pdev)
>>   static void ctcu_platform_remove(struct platform_device *pdev)
>>   {
>>   	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	unsigned long flags;
>> +	int i;
>>   
>>   	if (WARN_ON(!drvdata))
>>   		return;
>>   
>> +	/*
>> +	 * Signal all active byte-cntr readers to exit, then wait for them to
>> +	 * finish before resetting the ops pointer and freeing driver data.
>> +	 * Without this, a reader blocked in wait_event_interruptible_timeout()
>> +	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
>> +	 *
>> +	 * The wait ends only when the userspace closes the tmc_etr file, so an
>> +	 * unbind with the file left open blocks until then. Unloading the module
>> +	 * is rejected with -EBUSY while a read session is open, so only a manual
>> +	 * unbind can block here.
>> +	 */
>> +	for (i = 0; i < ETR_MAX_NUM; i++) {
>> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
>> +		/* The port was not initialized by ctcu_byte_cntr_init() */
>> +		if (!byte_cntr_data->irq)
>> +			continue;
>> +
>> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
>> +		/*
>> +		 * Set enable=false to signal teardown to racing readers, and
>> +		 * removing=true to keep a new path from enabling byte-cntr again.
>> +		 */
>> +		byte_cntr_data->enable = false;
>> +		byte_cntr_data->removing = true;
>> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
> 
> [Severity: Medium]
> Should ctcu_platform_remove() clear the hardware irq_ctrl_offset register
> when byte_cntr_data->enable is true?
> 
> Setting byte_cntr_data->enable = false here without writing 0 to
> irq_ctrl_offset means ctcu_byte_cntr_stop() will see enable == false and
> skip clearing the register as well, leaving the CTCU hardware firing
> byte-counter interrupts while wait_for_completion() waits for the file to be
> closed and until the trace path is disabled.

fixed in next version.

The IRQ is disabled in ctcu_platform_remove() while byte-cntr is
running, as ctcu_byte_cntr_stop() doesn't touch the register once the 
enable flag is cleared.

> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index cc341cdf8d8e5..d856f0a190f72 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> [ ... ]
>> +ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>> +				loff_t pos, size_t len, char **bufpp)
>> +{
>> +	ssize_t ret;
>> +	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
>> +
>> +	if (byte_cntr_ops) {
>> +		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
>> +		/*
>> +		 * -EINVAL means byte-cntr has no active read session. 0 means
>> +		 * byte-cntr has no more data because the sink has stopped, the
>> +		 * last etr_buf is read by the generic read. Anything else is
>> +		 * the result of the byte-cntr session.
>> +		 */
>> +		if (ret != -EINVAL && ret != 0)
>> +			return ret;
>> +	}
>> +
>> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
>> +}
> 
> [Severity: Medium]
> Doesn't tmc_read() turn negative error codes from tmc_etr_get_sysfs_trace()
> into 0 (EOF)?
> 
> tmc_byte_cntr_get_data() returns -ERESTARTSYS when interrupted by a signal
> (as well as -ENOMEM and -ENODEV on failure), and tmc_etr_get_sysfs_trace()
> propagates those negative values.  However, the caller in tmc_read() drops
> all negative returns:
> 
> drivers/hwtracing/coresight/coresight-tmc-core.c:tmc_read() {
>      ...
> 	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
> 	if (actual <= 0)
> 		return 0;
>      ...
> }

No change here.

tmc_read() returns 0 for every actual <= 0 on all the paths, which
is the existing behavior of the driver.

Thanks,
Jie

> 
> Any signal delivered while waiting in wait_event_interruptible_timeout()
> causes read() to return 0 (EOF) instead of -ERESTARTSYS, terminating trace
> collection early while the ETR is still tracing.
> 

