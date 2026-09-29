Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E6B3A718C
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 22:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722098; cv=none; b=mPcn+Wne9Je5sKEQteTHgNXvP+BFLHPerat932KQkog4OLSmzDsas91L5kP7B2EItpSyN3BbOWXmMYcccvl+GlTKBh+eTDydxK8SjHU2oMCnXQEv71hhxt/nBFzof1s1sB3OZ/aSTq9b9PFUdaOS2yxBzylxYzVKycc0agFsqSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722098; c=relaxed/simple;
	bh=2nsM+8CzPjQSlHsMUzl7bJcOPI4Cya9YI3+lC6qwK5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQ51s5iq972qa69tvdhr+C9Y4XcVMF0V35CY7CMApZ8QSXIqtMJuDaZHsTHX9JEQd3YcfQrpQaZmnCUxzFKGP52u34hDOFRJA7Qw3sIiYFJD/xO8d8fLGiZ9NW23YHKpdStQed9+zOf8hXI5x93LIFBILRCFG8DGOJ06W8+ESGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSQKWN6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yslc3Ht+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSQKWN6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yslc3Ht+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TLApZ4708415
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 22:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2UR1zL2vU8Q3sKeWdjvv6ON/jEipqUzCujxlK2hNPlQ=; b=bSQKWN6nD/c7k1x9
	Y0Cicwh8WoY8IGSQ3hLIQW/pLlbNJrUuamCC1yNbOkA60ht7pgONnaoaNEm9pEwG
	88COjMIvqx4hVfey5U+vTd8Lm29MkXMfvfXPmgb99dGyO5Dg22jDm0Tp2FWdES7v
	ZLwX/XnoFotTeJIupR/yvGJyd4YrAEYug2DXZFRr3HIuHrGBMc0UCx8BsGXxMbmG
	LIGZSYCl9WxdpwgDr7bH3De64d84YXgFbmQmtDspowM5ZwzM+HQVYB1E2vgRJszH
	srXnPY3bgYKmTGPSIk7RyDXSsohX5Zn6YfVu1ASOKa7QLvo6sg2xtrQUk9F99YdQ
	82Lqqg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0g1kst4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 22:48:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso1642320eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 15:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790722093; x=1791326893; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UR1zL2vU8Q3sKeWdjvv6ON/jEipqUzCujxlK2hNPlQ=;
        b=Yslc3Ht+iyrX+TXYgYT4UcR8yJuPtkA5VU7xJTuVvobstBWgZn3HGUVTlW2aoNIJP3
         /wgueNu0bxU5kqdhPDIv4VlR/g+SHQ8zWHy3Yg6ddv3woNpmFKlryeM7aXEDjuqUF5ru
         AYoMO/LDn5YWictnk1Lux+SgaiIbr6Wrp3yiBqAeSFnBpYD0JfKWWU+xGGVdB8OFCwkC
         b4sIeyxxlzA/r1UauHj+IaovA2dVVEBNkwQigJ1u7tRPZAX2ebCuXN+5B4vuX89cUYHz
         welURy5EiBmBbMyoCzHTlFfAtjpouiv8qJLYFZjcwX9Yf8vsOZZnM24S2A4rDJgZVFlY
         OhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722093; x=1791326893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2UR1zL2vU8Q3sKeWdjvv6ON/jEipqUzCujxlK2hNPlQ=;
        b=fCX/YOczjLIZ5eJ0JDwaaQ4vW5/o/O1Cyzc9y0Vx2Z0hQya9+iAIwtVVkZ7SMSf2pN
         x7r4ekpIqgdxSfThzd/fhN8b+lQ9O3RkDkxwdWLYeU9PC0mFo+uo8GWhpSz7cJU4TmbB
         D59s2XeeQdEAZtVuqGSqD3DQtfEky4XMVAXfDaqTQDB1ojf4miDShinrEXgirFl4fohM
         TyvMNON7s7v0EsCoFU6sCuZbI8GPEj8lczBiRQOjklrTUGDaHJuEbUeHD29LEvO4oOG2
         8GnWBzytQkatIs0v8GXgI5pFSs7jCM0zw2+caQSD0tL8oKKS3f8WZR7v2HQTrHTgDUzn
         fxvA==
X-Gm-Message-State: AFuF++luut/PKjhaOLFpFRBWaz+2LRdJfcJYVYkVr6MDm8487tIop8CR
	JWeNSehX6STnt8S+DKT8Jy//613iVReMlD54CEK+xuBc1nefzzxLLeAeH22+AUg7Hxsvc3MYu2q
	JFCn9yn/vHfYp/Rv8aOAjf7i73uXoGjimXvzxr8DelBUcj+z3tddsqzLh7WYAf7hhqUmivSBY1l
	kr+RU=
X-Gm-Gg: AYBFou2MwsY/4FOYtm/BPqdmEM6TrAG1BVMMihn6OzBSEt7G47BU4DTv/pDVOuXXuZT
	YoEYU5KgqWV0CrayXfsIX29tk5iaR7dix9WMoS74WFibzlUtm6WF4d5H/TCnhpWppaFgYzOT2Lo
	C4hkaLNCIt8MtYIN9akjBpMSfmchK49QzLEqvmpakaltgFudWxm1aPxsbgq5K1kqi7K/z0HGr5Q
	aJqUuhXi51scw8LogkpK5zdg2M/DpmLMMxggFOmBuKupPK2Q05I30uqiFu5TffjZPyjwJ2uNyxW
	7bV1AgQgw0Y6VWk9Z+J+dCBUt0zlhBZcpPbH4m8/sZeKycAETzFX067gaznsNISTtuUus9hpPxd
	yTZCOf5mJQuoRqflSyknG57yndEnJXLsc/Okz51oK3RVANG9bqvO82f0xSg==
X-Received: by 2002:a05:7022:e26:b0:147:5261:ee2e with SMTP id a92af1059eb24-14c9e676ffemr1113875c88.21.1790722093317;
        Tue, 29 Sep 2026 15:48:13 -0700 (PDT)
X-Received: by 2002:a05:7022:e26:b0:147:5261:ee2e with SMTP id a92af1059eb24-14c9e676ffemr1113824c88.21.1790722092660;
        Tue, 29 Sep 2026 15:48:12 -0700 (PDT)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c634f07f5sm1941625c88.5.2026.09.29.15.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 15:48:12 -0700 (PDT)
Message-ID: <b450250d-43fe-41d2-8d7c-a13b48dd4104@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:48:11 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/8] usb: misc: qcom_eud: add role-based EUD control
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-7-elson.serrao@oss.qualcomm.com>
 <20260929214703.AC9BA1F00898@smtp.kernel.org>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260929214703.AC9BA1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OTIeTte5eYHowmFKULVzDX_i3_VEMynv
X-Proofpoint-ORIG-GUID: OTIeTte5eYHowmFKULVzDX_i3_VEMynv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfX2FmkoEeaIrPI
 axduK+Yx9QX8fRU+e3B8iMOXPSZhTHMnO+0jgZiZIW6eZ0TPEUr/kuvKm787hxY2cNLRoOtCsOu
 V3Z6YFpDqPBlVYEPTGYsvQ1bB5d0NNA=
X-Authority-Analysis: v=2.4 cv=Ysia1IYX c=1 sm=1 tr=0 ts=6abc402e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q0PxVykpitmLHNM3NV4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA5MCBTYWx0ZWRfX7gEFtzIJ3T6j
 eFhUOLsXUvH4qyGgpAHOlrp/hOWWx7DIeOOqLUAG14Thp0jvy3MtbeeaXUHsoQDJLDw+D3LrooY
 TLSIRttGCLzosAumo+g3K6cW9ifAvnBZ5mMivpCcLhQiQ3BiLdXCM9nQJm7vMYf6t4QBcW/gWPh
 UAorVcvMGiUqnBxXYzmB+yXXovW0wkY9pRrdpN7dmf55YSLI6U09uZMvrGyd7c2Wlu9nZJhiN1O
 WzbdbTJqwBpsRkpZGBwquKgrFvuRYQ6wakZga9aMN92PlnqOxtJU6t9uYAonPWpqRvUZNtYVXv9
 vMio5Eqno8cRcyUvxvuYSEptlMtQSlbRl7YEVgs5owKEFtR3GSNSn9pVno/ruXvmNJPFwZFf39d
 DUcZsYBlJS1BInjAKDYDH7C12Va0vyGv5NpYWY7yQ7yO2SRhqOoRJPoobDsVZ/23NNdV+qgmNiR
 LyhvdkGzhonI2MbyMMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290090



On 9/29/2026 2:47 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] usb: qcom_eud: missing hardware and state rollback on role switch failure
> --
> 
> commit ac5ffb8b40f5366751bb4683118798fac6f6bb75
> Author: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> usb: misc: qcom_eud: add role-based EUD control
> 
> EUD functions by presenting itself as a USB device to the host PC and is
> therefore only applicable when the port operates in device role. This patch
> addresses this by treating EUD as usable only in device role, enabling or
> disabling it as the port enters or leaves device role.
> 
>> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
>> index e227d05cfecd4..5a21a2dd0b0cd 100644
>> --- a/drivers/usb/misc/qcom_eud.c
>> +++ b/drivers/usb/misc/qcom_eud.c
> 
> [ ... ]
> 
>> @@ -306,7 +331,30 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
>>  static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)

[...]

>>  	/* curr_role tracks the role from EUD's point of view */
>>  	path->curr_role = role;
>>
>>  	/* Forward the role request to the USB controller */
>>  	ret = usb_role_switch_set_role(path->controller_sw, role);
>>  	if (ret) {
>>  		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
>>  			usb_role_string(role), path->num, ret);
>>  		return ret;
>>  	}
> 
> [Severity: High]
> Does this error path leave the hardware and state permanently desynchronized
> if the downstream controller switch fails?
> 
> If a role switch to USB_ROLE_DEVICE is requested, enable_eud() succeeds and
> path->curr_role is updated.  Then usb_role_switch_set_role() is called to
> forward the switch to the controller.
> 
> If this downstream switch fails and returns an error, the function returns
> early without reverting path->curr_role or powering down the EUD via
> disable_eud().
> 
> As noted in the commit message, enabling EUD in host role can cause the USB
> controller to misbehave. Could this sequence leave the EUD hardware enabled
> while the underlying USB controller remains in its previous role?
> 
This is intentional. As documented path->curr_role tracks the role requested
for the path, so EUD follows that request rather than the controller's
outcome. The host-role concern applies when the port is in host role.
Here device role was requested, so the link partner is a host, which is
exactly the setup EUD is meant for. Rolling back would not fix the controller,
which is already in an error state, and the failure is logged and returned.
Since EUD operates independently of the controller, keeping it enabled
also preserves debug access for investigating such a failure.

Thanks
Elson
