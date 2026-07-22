Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7EF3B4E8F
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 09:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712425; cv=none; b=bQUA/ltK4RGp5KRJ4jo8sPvQ2oSLNRKfkeiHKFEuuzQZeqIHYSy+3IppCFHbydsG1ftuy6ZGioNuEUy0CjP/Nfmv56Ym4XZxXpoog6V35uioOK+H7AoF3sdUvDiwnUMCn9L3BNoRTtL6ZnZFnJinoT/uhinOOB81LyHQeBYnoXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712425; c=relaxed/simple;
	bh=xhXspeSkqB2qxFpZU3jQxXgdJQHh1jcbAIItdPywyf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+d7eG8haVgJ1cNPOUhlCrf1QXI9mgTyLHsnRIWOEWZ94bxu4TOspD1U3mQyArng72g7xRAsScTg85JJAwbRnb1oCLaMUvuAG4gRgZ8jwQCl5omaD3UtPofVLhl8WTGOiQNIRNWAB1X4bDpT8tdOwEIp512/XbzpXTmgL0u4Paw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DM6M3o/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCLKBTnC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DM6M3o/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCLKBTnC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xZBc269587
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 09:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GmXXSLuM+65AEjIHsAa+PdHzF+2smBIWId/4yRgNPeU=; b=DM6M3o/BC5qsz4we
	cdNf03ltSDaY2K9VRJ79T9yQS9IAn9ldHSwK2pjIrg72Pb7vO06yENIzro0aCY0f
	8J2GJ9W8ULSD3hr0LQ3NypFN6jnhBqJJJAzXva78MAMVLgWr2Ac1zkNxLa/uCUF5
	bAhl/E+b4ihgf1AjHXI5olaeUO8ZbCeODvg7tolNYt1zyXS0hWD3aTgGnw/SqXD4
	kgQk8oVkBX7wiXn7NdfiatXcnalbIDiHStdHEvhRhEdyGBFYOPZGusmAaiOKCyoE
	R9RmRvILPbWzrmA1HI1ICMGaXtzpsbN1erj+G8UwJL1X/JFnF0Yr4zPYES0+bDTy
	Py36dg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ab8ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 09:27:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90786218dd0so14823736d6.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712423; x=1785317223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmXXSLuM+65AEjIHsAa+PdHzF+2smBIWId/4yRgNPeU=;
        b=SCLKBTnCNBPeR/uvTaPFmddfioWunA9xiC3r9RpWdz0Sts1q7JIamTcp+ErNt23hD9
         +WDGuI77xwIGEwMtMAVv7NQjAr4i70LmHBkheI7p/Kam6aivWZu3SQXzooQRHtI6Er+W
         GVNTdzFNsg6nyVdo46Sv4lGt3xghgNCOQ3WZJ5SJohOno81W0cYPaJvbKevVs0feAHc3
         NgR1MTvEuQx+xfDLbdd89FsSIbT449nz3Z3eIGr4HxGMDt9KHjcZZSn2ouGASt1SmgVB
         QYeWAgOLvn0jDREVKFp95HTvBwUIgWqo25iG6G68ux5UhRLq46b5RBZP73zDj9l16DLd
         kR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712423; x=1785317223;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmXXSLuM+65AEjIHsAa+PdHzF+2smBIWId/4yRgNPeU=;
        b=ia1xW33yqx9GI8H6KAWRenZILQuTvGcaqef1QSd8kQBTvnnQ0bNQmD6cotfqnLk78O
         AOavOBJoJYHMINrlrJs5XTmM3uw8xBSEyLU4rZaVJPpCInbcIRnbdwSC2XiRSM9lsGsd
         iX2Y3oYE8rR0GJVNxrFyeoeWAxtj5o1iSsyoQf91hnDARc3Vfs8TPil/JYgnHkHyK8s4
         bSZVP7A8rd32O/7Yu3B/BU3wFdRS77NPPSPaSd/ADQoNWSLkO+VipZ2Os7OA0/HcnCTX
         1Ueji8qxTCucAL5Vmy14RCotz9VPz9xS8NmdX2ftHOUcbklgazVeJyBgnYZx4Z1EqSfa
         uZLg==
X-Forwarded-Encrypted: i=1; AHgh+RrJTuyuRVKW9D7kV7Uo6nbtSnfK8iP3NFpsfMfUXcHfOuufnIvxP3NqiXLGkLv3prXNstPnQT84hwWm5OYgZCc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxP767xAQAE6KXh2jsUfqxMxPkr5CrQz2PxyYrtEy9fRWg/38Go
	9h74GdU7zlZlNDyqBty7jxE7tx2TxhPb7YmiYn2hX1QLLCOq8uasi1nH9IRdQrf3x8gaGvWdZ2l
	QT9Oyti/WC5ECurykDGBgMBkagZQ4pj9psjPW18K30lao7bgqsJM0sTXVEgwWVlSXE8a/+5s=
X-Gm-Gg: AR+sD11Z0FXkwwKrdxCt9Vlb8EsngkuQjshMdivfZf7Q9OW/Qj8f7t0EJESLUkFsaNz
	fVIBvsz6id5pHEwdHVIxIjvIYV5JKAmder0Ygw6+M5NeCIkQrKMlOmgMSLCgvQjHfsZDdTzT/bp
	Y8TMP/FTuAo/LpF5ThlIKp7RVaZLETLv1M8dPRhYK/bGHvcJAQRydzwpBPpv3Fong8A/FTeKgfU
	92l2VutbpCPWco+sl5rerafc487JXBYEpZbiRxhHn5oZtN/cHkqutaM0DRyRdCJNKTt6symXDWI
	8pGC8zGIHy1LG8fimcjXnBHQvxxzqyh9G2RkR/oOTYbJSRVORy6rEijMpZ40VyIqOrakfiUJgRT
	jNC+tGMGPr6Bx5SE8Vd+ySlHh
X-Received: by 2002:a05:620a:2548:b0:930:a08c:cf9c with SMTP id af79cd13be357-930e6f6532cmr568150085a.2.1784712422502;
        Wed, 22 Jul 2026 02:27:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:930:a08c:cf9c with SMTP id af79cd13be357-930e6f6532cmr568148085a.2.1784712422027;
        Wed, 22 Jul 2026 02:27:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c903c2sm76219766b.32.2026.07.22.02.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 02:27:00 -0700 (PDT)
Message-ID: <b8f316f7-0036-4d10-987f-c43d60dae854@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 11:26:59 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20260721-topic-smem_dramc-v4-0-748f992278a3@oss.qualcomm.com>
 <20260721-topic-smem_dramc-v4-2-748f992278a3@oss.qualcomm.com>
 <20260721124005.E00041F00A3A@smtp.kernel.org>
 <6rmntcmouwenb3t5xk5rh2rijd3sc3re5m4aeuqive3wifn6ux@hauua7ltycvj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6rmntcmouwenb3t5xk5rh2rijd3sc3re5m4aeuqive3wifn6ux@hauua7ltycvj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX9vSh+2p8l7yc
 GCDoUFYqyivm/CWYkMS8WsCNaGBmMtTs8veGqDweKy7TnzGTTAbjo0V806WM/I2QCxDDsW0JgDd
 1fGPFpahylnp1oMpe4it/RbkyxZNvsMqTMOOk/ZeVisxi6ZrjpLj7Tldsd4irjqWbTUbNJFMSB/
 W6kq93UN4DJdyFa+dzJWcC9HY8Qk45VWA/JQLbDUPhi9IHQsgBpu0E4Xu2Kg1+dInXpTSPWZ0Tp
 YdzlM+ghyGNqKIgWpbFgZRiuoXdyQrLb2GsmCL79zYCLEDNqoTscUD8MP5zDIrlZaIpTGtXgaOu
 CokgIqoKIgiDGiYcrM9KNSSdkPKFNmq9yqfB4a1J8Bu38NRa2Na892vI+rEERU8uEI/pbgc7wvf
 L9gQlHz3lhNMyY+cypvM4t5+3vHWrF7IjssBbGksi49GtWALrWA2FogcwMpU0t/finBn42foGea
 ChOXmet+/vJ/QtwFEAw==
X-Proofpoint-GUID: cyvzQQUrx8JKrIIIq4QeAZQsNbVwnign
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX2nIRlSuM2W2k
 ga54+h2/AZHKe8ZGk+C8k3ekh96Y/PhthcO8FUxjaOQtDm546u1QDHg9VKPE9rXLjhQDZKayA/C
 C7w/gu00ju+sLzco7rvaMsZMQoilZGc=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a608ce7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Ey9pX4ziOnSd-lTtWQwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: cyvzQQUrx8JKrIIIq4QeAZQsNbVwnign
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

On 7/21/26 3:40 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 12:40:05PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] A race condition between SMEM probing and `qcom_ubwc_config_get_data()` can cause the driver to bypass probe deferral, incorrectly fall back to default UBWC data, and return mismatched configurations to concurrent callers.
>> - [Low] Missing Kconfig dependency on QCOM_SMEM causes linker errors when QCOM_UBWC_CONFIG is selected but QCOM_SMEM is disabled or built as a module.
>> --
>>
>>> @@ -178,9 +195,30 @@ const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>>>  		return ERR_PTR(-EINVAL);
>>>  	}
>>>  
>>> -	return data;
>>> +	hbb = qcom_smem_dram_get_hbb();
>>
>> [Severity: High]
>> Can a race condition occur between SMEM probing and this function, causing
>> it to bypass probe deferral and use incorrect default data?
>>
>> In drivers/soc/qcom/smem.c:qcom_smem_probe(), the global __smem pointer is
>> published before the DRAM data is populated:
>>
>> drivers/soc/qcom/smem.c:qcom_smem_probe() {
>>     ...
>>     __smem = smem;
>>     ...
>>     smem->debugfs_dir = smem_dram_parse(smem->dev);
>>     ...
>> }
>>
>> If a driver calls qcom_ubwc_config_get_data() concurrently during this
>> window, qcom_smem_is_available() would return true, but
>> qcom_smem_dram_get_hbb() would return -ENODATA because __dram is not
>> populated yet.
> 
> I think this must be addressed, the DRAM data should be parsed before
> setting __semem pointer.

The DRAM parser uses qcom_smem_get(), which relies upon that global being
set. I suppose one way to fix it would be to initialize __dram to
PTR_ERR(-EPROBE_DEFER) and returning that if we need to, but then we
go further down the hole of needing to assure all these getters are only
called from defer-safe functions

Konrad
