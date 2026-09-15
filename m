Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFC48A8CD
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473969; cv=none; b=HicsQzh7tystzCKuKmLwqknuEwOqhGy7hQPbvdHjsQg8nTRIgofRTgD1RHzeSzAYVXx5A9UPNmlAvBg8EUWlJKlC095aLRHTZkgr8+P7iXrQUIKkKyVUcBtXKC+/ZE+ie8YYhaHEkTfYKXNyMAKB7eVo+t9vgz4S7lwp2uMLWBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473969; c=relaxed/simple;
	bh=dv/lwoS3V7d29hXoBa6wYe4ULnStOXnmpv32FXjlKnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFwWHlk87sG0cRfTd8l+Mkt3X4Odrf650jGuMArcX+gK7nW2LryM1WdwUDbdm3XIeT2Ohx88cFkPyytmwrO80I0sZd1ZCG3YOioqUjB4UNjc3QQjgAikxV5/h1a74FXr9BNXD3lyrGpr5NiAFCBbWJH2jBOO1zsbGyJ+PNxpH0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3GdsLBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQbje7/W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3GdsLBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQbje7/W"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h2Lr2086727
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dv/lwoS3V7d29hXoBa6wYe4ULnStOXnmpv32FXjlKnU=; b=e3GdsLBLUVAuNn9c
	G5ogt74tr2F3FV6FavWt3YgI2isJhLyqHATDiyw/nK8oEDUcBhmTYUOEoEDSsMXW
	hjYQiP7gqxLN+BscNuILSYaHfBBG5le39KsiRSlVkYh0D8l5B5QuZ3t9dXKIVQte
	lBMEwH0W8OeV9qsOo5xRUBg0xbU/p6Qbc6VePgYAPhs+H6laYwwOsCdCgP/LNHac
	dOMqfFtVFCK7ZPtAlcCRNajizS1/RsuIfs4z+cT73BzdPks1a3SWXwHc6+C9ds/O
	PchiAYIpaZHDtZZzoaCysHI+6rUtPo7xuC4FQIB42U5gULwxv/Xv0vymAschkt3j
	2WZo7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9ark-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:06:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so9791072a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473966; x=1790078766; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dv/lwoS3V7d29hXoBa6wYe4ULnStOXnmpv32FXjlKnU=;
        b=ZQbje7/WLK/JE8KHtqleKmRTrtMjHEQsp8pugOliYAq//HrMRiqFqtsRPEWE3SyOEz
         kRxCp8KabZJ7tE/7nowM+3DONtoSIYU1kq2LzYUBkfKeyaH/cQDj1x+pUtPriS8nUlIC
         K4cnq3O2WbXwTnYKrVPpPFbpdOYFfdlbwL76TegcQuLpMB06aeCZDeIkjsRgq8R2WWP9
         kqeJQ+cnGj5LNoo8nfls2hQpHdIA6LFWQPfFa0uTVIr76Rlq7Ex0Y/kf8bgPBxQINFoG
         cB4iPFtwi+wp1wIvLUbTOFYIQteucFGVyfj8NPmY0baz+st9fXgJaXf2rwpt6CPt6RDL
         a1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473966; x=1790078766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dv/lwoS3V7d29hXoBa6wYe4ULnStOXnmpv32FXjlKnU=;
        b=FE8AZvQnpBFa+SFNmAf3Irx9hkVnkbi0B1mGdgpGGgZHmD1NOzpFbyyIv9lyIj7FM0
         qIIzwFarapoFK5f9dYIfGHMwqw56GeE45vyKL+Q8Q619a2WTBzyhbOG5Wz6qV46AhjCL
         BsvJDBWj4Rk84HMmzBAXnvuDSIlyJBaw4KyTkajfejuxw1q7WzvatE76q3t2FO+pAafR
         c8aTYcG+9Hma7K5cqyjlS7EoyHLBOefnE8HV5XMdzE+LQbMKhfgAdHb4xDLbrvooOkqu
         Y8Fd6G923jefhoMtEPAiG9fpbjbWjCC42Qmtd6+ia82awmAIHVaiSdZgX7UMqqLG5kMv
         zaQg==
X-Forwarded-Encrypted: i=1; AKwUvByC5ZGjSavONCKAKCxJsxLtN9x+PwbqKvkyzc57NHr5iLHnqhM3hC3qYEG0xP6GZzmiI6+u/TcvCSuWDPfDHnw=@lists.linux.dev
X-Gm-Message-State: AFuF++leDjUDT59UkfUfN3g4ZJAjcUf/GfdD34hsTs22hPAGSmzO2EEe
	B1Y/tMvcAV/xuUx17AQB4nuhuU+m+REcA9H1NiHpnTIVU1AB/dlYODlJpl4a06iQUpnl0+kWduN
	juXMLG8M2ZcNxigJ8HfTcKSu5wHD9uAMnO+bOqAZbxyxaNEtjSJcrPGKPJiXlXR9M2BLSyYaNk9
	VWsdg=
X-Gm-Gg: AYBFou3mhA5dWhQlQgDIDy6AlA4Vj5H9xPirXr4ktWyHZMnpPGW775Z9Fs8JojOD+TY
	gtyAh3dK6wTZ7MVOGIIoz+ztmjK+tiQ4uA7xVvhO6Qb/SxdNLO2Nf38+Hrw0f3Eyri2inX+G8kd
	FjXAKOxRoMXbJgAqvcisSdW4Vqq/L9hmOeU75lGMq/Joii3GkQ701MNDFX7JGropfNfTuZjeqts
	OqXM7i0X8Iq/o6CZ2eUl/ghWSyQXCPFUoqqHds0xir4EWXGT3KyqQhyWrCDUwP8c1Jo8fQ3G/7s
	Q0XJ4FoCN/zfbla6a+6xZ1HdLyXz8oCaPDHxWvPa+WijqgIUSudyUoH/9EkVFJrAVcagubc743N
	ziP70CyLhUeZOdhgRn566Jd/qt3g=
X-Received: by 2002:a17:90b:2711:b0:39e:f1:b2de with SMTP id 98e67ed59e1d1-39e110988ddmr1151948a91.20.1789473965107;
        Tue, 15 Sep 2026 05:06:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2711:b0:39e:f1:b2de with SMTP id 98e67ed59e1d1-39e110988ddmr1151902a91.20.1789473964758;
        Tue, 15 Sep 2026 05:06:04 -0700 (PDT)
Received: from [10.204.78.62] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm6625938a12.21.2026.09.15.05.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:06:04 -0700 (PDT)
Message-ID: <725a4dd0-6882-4c83-ae68-109764d4daf0@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:36:01 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/atomic-helper: tear down HPD/polling in
 drm_atomic_helper_shutdown()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20260730-dpshutdown-v2-1-441fc5543bed@oss.qualcomm.com>
 <20260730130104.3B4661F00A3A@smtp.kernel.org>
 <5n357w6ytzwbksbh2lnv47gbkioo3epbr55ddrw4ipn6vikexp@kbwvjmjuzntw>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <5n357w6ytzwbksbh2lnv47gbkioo3epbr55ddrw4ipn6vikexp@kbwvjmjuzntw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX1TN6/xTqfai5
 0XaNbjS1ETlndJMuNg+yjh5J8CLqNTIS442ccofibtc64WQaWiqPDWGI83UJAZURjwQme7lwtd0
 hg37XyGr0eHE4lioVbyUfCfFWyjx6KI=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa934ae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=O6i0__nPXQNZU44mEi0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 2a4uqOsbvM7ZEHSeRm4SMqPw9xtLCMhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX2aTUarwSAHSD
 9F5e3+W2plVyVmhrDFv/W4OYgk8Jv6bAWXLCzHYZK5OmZsWPZjzQSsny41CjdstBJFVkrZEsW8l
 eUCGYIHPuGmigKM7I7Hy0N4Cf8OD8R1tVBQu+r8WKPsSmJaaIVU6BP/49SnVl9F/VLNcMF6YjWY
 PFlyoK3UjE2Ux+hR6pOmvUiHS/XzuQaxTgEPI9ZwBlr7xQFEMNtZsbu99ah/n+vUJxwQ5fEBRrM
 juEdnJasmQQphpfSLexIJCvEbgzTbntRfheG7VdGlwhBnBPG40s69qVzekvVArpvSByMcJv4RKH
 aEIVjLKwipLiavdImTa/oVUMQ4LHhruHlsfzWMc3LqonxADRBUjAeUbvcorgCSPHwa2S/LJfJgh
 g2NIlUzyLfM8JE/zZfudrsLS+jGH6Viai8+W/27OftjWP4SHlOt/pxhZ78LITLdr8sd7pJes5oR
 CJq6NUQbRn0pugv1aeg==
X-Proofpoint-GUID: 2a4uqOsbvM7ZEHSeRm4SMqPw9xtLCMhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150175


On 9/14/2026 2:20 AM, Dmitry Baryshkov wrote:
> On Thu, Jul 30, 2026 at 01:01:03PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] drm_kms_helper_poll_fini() fails to synchronize with in-flight driver HPD threads and introduces a TOCTOU race with userspace probing, leaving the original late-modeset bug unfixed.
>> - [Medium] Calling drm_kms_helper_poll_fini() inside drm_atomic_helper_shutdown() introduces a regression causing a kernel warning stack trace (drm_WARN_ON) during driver unload.
>> --
> No response from Mahadevan.
  Sorry for the silence. I had been skipping the bot reports as noise,
  which was a mistake.  I will read and answer them from now on.

Thanks,
Mahadevan P
>
