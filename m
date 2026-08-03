Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1617A586
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761546; cv=none; b=eIinPGvUA1w+DmERUSHGCmj388UD1C3qvovoxLMEiv/nKBA8imhfHkhgl+EY1f8+Zr8Do7bJ15cadHXvenRol7LSuH6Dut9DSkYb7D3qVEcr25Y/xQd10RsbMtnXINmViIfA5iTifQn9JZcRFXB+dVo5O64IKGghoKgZcGHLnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761546; c=relaxed/simple;
	bh=0x1+kUeIY1ww03zMcigz18OPM59MnPltsz8N6gc6P6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyYJrEVctCvBW3ykOFF4BK8lHB7589QIICWl51e7vDbCOkUq2aInuha6stvHKmU+hDEgNoR3s8xwGJo/gRyTUM/LZ0hW/nU3bcc79QPAMI8RPB9nUJmeN22uTRqA2pvUwY7/m0PEdVGwJojkrbLx1JSUlVpCE3xAaENS8JA7anw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezrct5nv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kC8Uy8FR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezrct5nv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kC8Uy8FR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4bs9305402
	for <sashiko-reviews@lists.linux.dev>; Mon, 3 Aug 2026 12:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+LKeb+uUFJ6hLyBuz5OTVAOzU/JDexS665a4MvqDiU=; b=ezrct5nvd0Snvvlj
	DTH2GOsdXZFN3ZmhjK4p74GnyjPDXhQBaenp/gMSvUGAGACXHNwrEz7EEIwPolc1
	rV3ez2C28JADV92CkPgUSwey9udk2yqVMrzHK1XozCkmpa+2SNVjUA+hnPwQnK3H
	5FRWrfR1D2azxlCG/ngAbg9hyxkaFShuoylD3yjT3o6EI7uj0rEfsYzW7Q/ZJSPI
	7ZhkQek6y6J5rvkVutxWS20BQAGVjM3hRJAcERNB5T3iO38wbdXxOnzvhIYrotw/
	8LEaJYotIZLmbfw8R6w9LhwSMQx7NrZ7nESL8pEYOhTH3ZSd8xMsJBVB2/7NZ5da
	qUTcqA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb1mmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 12:52:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so3942197b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785761543; x=1786366343; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+LKeb+uUFJ6hLyBuz5OTVAOzU/JDexS665a4MvqDiU=;
        b=kC8Uy8FRFcP+lCm6A2RkbtpIw3Lu6aYqM63lc5rzZqup4h+35LITqnNBdcFu7smWHQ
         9GEzQ+kBDaYJlF1YYUunn7GDy0koHJ5obLRtUV8aLM9RpdPgqH4yY65uN0pZbtOHPI96
         ZGDI8JlFaRYDwmA52a6IlUgZkeic8k7BT3IGq0uxDDo+L/Mr21c0OAaaPtXPFiXVexPi
         4zRQWGUqriFk9ExF9TNQftNQda3tow6Tfs9Y2HtBTC0eXRVFatSDdRgj0c2n9HduJCv5
         TXvbSWHT2wXLSJyAu0vc54I1Htb+/95qNVipkEBN4AtYwylvv69ajMbShdn4QCALibjO
         7C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761543; x=1786366343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+LKeb+uUFJ6hLyBuz5OTVAOzU/JDexS665a4MvqDiU=;
        b=Mkb5OXFFDJ13QVggx0ehu8UqpTEpGoLlA8gHB798fzpeg0q77cIvHTl7R8qtB3N6af
         7RmPMdtybS67AlUxhns92Me6++9olbnNOarkcTuimGbEGBFMGXaxUiWZ+eTqpQeCq/tb
         zxKiPXxO9AxIZO7Z1g1rDDDspdcjBrih7IWz9OcuEoUUxLBF30nLb6HVrivXy0PAf+Zg
         XgGj6DtLyQnl8zpr4B7Gipn3DUoXfg/YRMliPsGb5dpqIuIoUcI254b9H/pVDoGBaN5N
         x1sbsNqL5FfWv/dFogG/qhoxsn6t4vBBM1o80001i8UId2J/DGHdYDcEwJ/pd0FL3j2e
         LlnQ==
X-Gm-Message-State: AOJu0YzPVJcIvi9+MfevMQZ2vHt6nO4mwpKR4t27nYOxMvmGHUNCKyK4
	ZgD8R+bxDriJyThqSrbw+n0/mlFi71vWnJeXTIZOuTqufGpCN9NRBNjTy+YMpDs52PmEr4WNvFM
	6wQOV7GF7pdTF/d47UIF/mO7rTkgWZssp/rB/Y96u17irFqdpAGAbBy1jg5/XCAuLYO4rwIowTs
	hMsrI=
X-Gm-Gg: AR+sD13RCU/8f1jARXPJ+U2dEs0N3JGQ0UGhtKqpEw9ldG6MgH9seVdbvceJzsOx+ik
	+H5Rk9t6nas6KSHhZhukRwY1BsPZDnWgLfL2aPWj1R3eshqoQibMv+hIO5LmQj2KRwyZpDTxwux
	LYrLxJJnj7UX5Iiq0nU2dCbzJcKx8aUlR6/kFq0WKbRfUmDISCyUUt3xWYmRjOuzmtfJxMBiV3z
	WD5vGESUVrBmiskPljv0XbPeIZWjWK0gVNAARj7azKvRyfqEEN4PmX+Ph4gxV4lynxcLOgTx7xB
	flBx+o3pvuVzdZJZLXyJ7BPVXX7tQN3GFhMEb6QlaypAvIazKSkY1vGr2Bbg5l4BpW5IeTrEgaI
	jUou1WQISezhCZqpo1kAfqtOPhhSystvANw==
X-Received: by 2002:a05:6a00:2382:b0:84e:695:edfb with SMTP id d2e1a72fcca58-84ee492901fmr8846021b3a.54.1785761543335;
        Mon, 03 Aug 2026 05:52:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2382:b0:84e:695:edfb with SMTP id d2e1a72fcca58-84ee492901fmr8845979b3a.54.1785761542645;
        Mon, 03 Aug 2026 05:52:22 -0700 (PDT)
Received: from [10.218.44.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35a4esm3705788b3a.10.2026.08.03.05.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:52:22 -0700 (PDT)
Message-ID: <eb7c8660-1892-4cd3-a960-9f4a15ca31d8@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 18:22:18 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev,
        robh@kernel.org, lee@kernel.org
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
 <20260803100748.34BE81F000E9@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803100748.34BE81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sZRQA-ilXq3pnwFF8BTU9gOB8YD7qfc7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExNSBTYWx0ZWRfXwkr4eYevBKs1
 texKNlA5fmwsMJw+YHHc9UVvjuuXx7gkQoNoIZ0u8EMaR55Hn7cAcIhMkvuX0wbQAV8nxzxMaGB
 tWdYF1HcIaVBPJXoTcccP8H35B8Nj8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExNSBTYWx0ZWRfXzNSw7pnOuL/Q
 5pVOdfhnqKdWjNL1Efu2PSbexevh7Zd4WvcGJSlOmT9eMuARK0nf1m4n97wospwEYxIyW2zrs7n
 qtL1E4M43WR1qgKdHFR/L6itVy6ObcJrdc3yjvKW3fi0eSaH8ikvpWNe+Z4PXberWTzIMF0WFZJ
 1ZtoT1RgUxi0cpppPQ9mUzKAU6FdJkITuu37JRrh7IzE00NWVbG6AczxRzKm/4W9hiWylDSHE/Y
 ph8UOzLJdIxra2Dz5U9N/pP1cc7rUWupCBsEbGHVWMPhOuUkL61AFq6PXIazUyfmMpkTgOcrIg4
 GqDFqkuwLmhCJsBwyAUiNkHWPO1Zv497mSwDXPy+/wg0a7wJwgogVtgmQaAZk6ipwjMNOm4tFwU
 ssl7alExZVWukpSZuYUv3KZaBixIVxCzBkBt8yGvKCY3U5kn7+DcZniG3l39Y8pR5DDen8ZgudE
 R2NyEOpOWYCPh3TtErw==
X-Proofpoint-GUID: sZRQA-ilXq3pnwFF8BTU9gOB8YD7qfc7
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a708f08 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l9OOgqi_LA2bN5GlWgcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030115



On 8/3/2026 3:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The MFD probe function swallows errors from devm_mfd_add_devices() instead of propagating them to abort the probe.
> --
> 
> --- Patch [8]: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child cell ---
> commit 88cfe078ed8299db3dd71fd877f29ff443d5037e
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> mfd: psci-mfd: Add psci-reboot-mode child cell
>      
> This commit exposes the PSCI reboot-mode node as a proper child cell using
> a named_fwnode. It also registers the psci-cpuidle-domain cell first to
> isolate it from reboot-mode failures.
> 
>> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
>> index 7affd6bb09dd8..7befc4fa86f5d 100644
>> --- a/drivers/mfd/psci-mfd.c
>> +++ b/drivers/mfd/psci-mfd.c
> 
> [ ... ]
> 
>> @@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] = {
>>   static int psci_mfd_probe(struct platform_device *pdev)
>>   {
>> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>> +	int ret;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
>>   				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
>> +				   psci_reboot_mode_cell,
>> +				   ARRAY_SIZE(psci_reboot_mode_cell),
>> +				   NULL, 0, NULL);
>> +	if (ret) {
>> +		if (ret == -ENOMEM)
>> +			goto out;
>> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret);
>> +		ret = 0;
>> +	}
> 
> [Severity: Medium]
> Should this propagate the error instead of returning 0?
> 
> According to the MFD subsystem guidelines, if a child device fails to
> register during an MFD probe, the entire probe must fail and unwind
> previously registered children. By setting ret = 0 here, the driver reports
> success for the parent probe even if the reboot-mode child cell fails to
> register. Does this leave the device in an incomplete state and violate the
> requirement to propagate devm_mfd_add_devices() errors?

This is done on purpose.
psci-mfd adds two child cells, psci-cpuidle-domain and psci-reboot-mode.
psci-cpuidle-domain is a critical driver for device device bootup on 
supported systems. psci-reboot-mode child is hence added separately as 
optional child which will not affect the probe of psci-mfd.

thanks,
Shivendra
