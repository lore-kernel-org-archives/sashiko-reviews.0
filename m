Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FE33936A
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717966; cv=none; b=OKyKOATdreI4841M1aCxWMBT39hYWLax92tz2fY2FXMCDQhI96AQadHUne1lXIXV/CIqwEZEo/FH/tJYIfvd6LAF029kdKbv/lK/Pj6x+hA0zhBUTm/vwFW06LzyrX5LB5OBqPl0e2JHewWd31jkv2ADwFAxGmdwO5HHlGuulvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717966; c=relaxed/simple;
	bh=NrDUtXgt3VxZ2CF7jWvMKJLMguPp3JwFlEesv3zX65o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXCMSNv+OCaTUT9fqRgVtA3mPkYPyPYx/5RkH/DSze4CYOUMsvT5i760eG5Nc3tpnYIsVy/QnAZsrdxcpFyrVjSM2z2EWazZwQ/iaOuNpcnt0z5N2qJhbPTcaByQSk6HcIKTPNzxgy0GbAAw5q+wzSHaHmeP9Ki2zCHwzvvOc8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWLbumm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEssTnTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWLbumm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEssTnTU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xCbg383963
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wH1sjaQosPgv7pAlBebSAlXiiHkmqfdSdHCV2kzhWcA=; b=aWLbumm6ygFLVY4r
	8w3MmrM8pnm1TWIgpO+xdWgsyz3aDj0/O5BBXcQ/XEl7wbhSsoVhGwZL7CF9o2Cw
	PBEgQXfencPRliSNr3zSTVuig+TbHyPrEt9S/77KdXpjAjdercwq4+k+VtelNFxU
	BwGOsJyeoOOEbfE5rsPGs3xuaFcL0C7kz5TEUqNRZgCgVc6QvcHIhePfBUJUmjw/
	uoyGOYgJM3U23otDP33GtchfnIgtAYDWlKxj34PzOStWeTrs9TJVF93kU8PB4tn7
	dhq4w1/dRx7vSpo5QEqPprl/TYw15AeUZlAzudvvaw37dkafl84rlalXEbTnR2Fw
	kn+mRA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928x3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:59:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so102783206d6.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 03:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717964; x=1785322764; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH1sjaQosPgv7pAlBebSAlXiiHkmqfdSdHCV2kzhWcA=;
        b=aEssTnTUqLjBQqHOqyp/PA7FyIBKgDklVlQgyiFtKbEHVA4JfcYsPzHYscKzWpak76
         gd5w8kXbDpZ0T5W7tM2WZ5yf/RmVzk5LQglfj58XNhr+bLp4b4rUuJQJTzmpXXBKW3j8
         F0xkh/cqxeuOyL1ulcMnKJz2/sfOXTOwhceHhJ8b9jzk1uqgCQj/VYEZA+wn3a2qGR5N
         Jpan6v2OIiSni5g4J+yevzBnYhOa21MebaRYRB82El1wFZQrNVtnHj7hp/7tNyC3/5iL
         jfkCJPF19uHJ7YH9fQnMuo3SgtI2hbHxT+7FES6cANf93j9TvdmtpQ5zVeTmiC29Zeox
         Tpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717964; x=1785322764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH1sjaQosPgv7pAlBebSAlXiiHkmqfdSdHCV2kzhWcA=;
        b=H5Xlf4CdrBJ53Dxkcr0ZJHjFP8BhWnUldxo1nTP4K2nzfc4PJVeIOL0hd3hgIvFUOb
         6TyYg722s8bv1XcqB3OdDzUVJcPS5c90w2RAeWaXXcFX4FRgz652hggvQ6iXGoMK+Gn5
         Gf67tPDUy6F3EzdACXRxClkgzkEHcotQYfXVeo01ymfJvgp0XC+v9tpYOuwBY4I1Vr0U
         YgPI7/jUQ6K7hr9paP7FzL8DkR2n5PbQOok3lTr/+0f5b6ea1E3PXDC4Q+8lwUj11/fK
         PNuaTKjH41MK4f90XNGNjUgn23V2R90kAJ8xksGG5wg0eVRFlS1h5Koypni/fDvLaTbi
         Kvzw==
X-Forwarded-Encrypted: i=1; AHgh+Rp875UeVESDcPxmio50TueGIJmp7liiscfC7Alyxg/DjyqG68Ni7QvrESGhI6HyCOsnv8WmPMp84sCBX3HtJag=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRFd/rCXQIyCxgK9rlsM9Nr1rEmsCEod/QFUNXuv6zr6ouINBj
	HF04Umg7PkaentOn5MqYkD74yDGdY5qneZBJ3Ctj9V4USuGCEpTz+oLUZfpiCgpPgmXT9Xc/CRa
	+J+B9W9hFrfV+7Lc6Syq1DckpabOONkbqAzpx3xXv5DS7nogzzSrcCwRSrdPJKkBou8AkTrT1VD
	WTyfQ=
X-Gm-Gg: AR+sD11cJ0WM8z0f4qhNQCdbm7TdYyPqxYrr/J4GAnwIWBQgzeiBHep8p5qD5ZMDj6o
	uQqxM9AmfH3kydReRHdVBtRzfwWBXFPU7pHOqPmw4juJfyeJLoa3l8KOzQ3YReaJP7y1Grw/ltg
	tpVXSFlVsB/sZHsDlWU6HisgCIn2u6h/oEie5PbbU58fBIzJKxmLqMxzM9WSi2UWDyoZOyoLihY
	MkJ7vHgIgBvXEMuKJjShEoTwvLHaWClhU9ttf69ueFVBzw1oX4C+LAPdsKrVEMUosaM+8c84pcL
	etqcM5eY+FWQYh4dSdl4aTyXZPY+M3szkgdnbfY8wbmWv38FGUguAcCUbZ1gNteOB/l5PUAneKF
	W/P4JM887GRno8zPd3WtEKoQ6Tkfa3pAj40tWcsG9iWxCnlnDzoiyvx3TFvnvdxbxYQ==
X-Received: by 2002:a05:6214:c4c:b0:8fd:6de3:dd84 with SMTP id 6a1803df08f44-907784e0754mr238777796d6.58.1784717963715;
        Wed, 22 Jul 2026 03:59:23 -0700 (PDT)
X-Received: by 2002:a05:6214:c4c:b0:8fd:6de3:dd84 with SMTP id 6a1803df08f44-907784e0754mr238777596d6.58.1784717963199;
        Wed, 22 Jul 2026 03:59:23 -0700 (PDT)
Received: from [10.111.173.228] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e18d4sm18435106d6.23.2026.07.22.03.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:59:22 -0700 (PDT)
Message-ID: <45f5a552-0365-4d33-8ba9-ce45d48ed3ba@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:59:19 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/15] drm/msm/dp: split link setup from source params
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, freedreno@lists.freedesktop.org,
        linux-arm-msm@umbar.lan
Cc: dri-devel@lists.freedesktop.org
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-6-bea261bf4e7d@oss.qualcomm.com>
 <20260720062728.89BAC1F000E9@smtp.kernel.org>
 <2ysoleroryfoh3tosv54iyq5t6556k4uf2hkp67fofy7gizkhp@3koilwev3czy>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <2ysoleroryfoh3tosv54iyq5t6556k4uf2hkp67fofy7gizkhp@3koilwev3czy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX+NNjl5OCWc2D
 lBox1wWkG+l8uV3xNw2UBWZU5ZxmCzESxv/ALdgYKNRTB1pjdP+kGglSh+q59rarJsk6076JAdu
 YdurEN2neDFqc4Nxvajx0F+hpKmIHz8=
X-Proofpoint-ORIG-GUID: JEB2VIX95QDoZNsHHCHYz7-oewONAWwH
X-Proofpoint-GUID: JEB2VIX95QDoZNsHHCHYz7-oewONAWwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX3G7oTdhkOMuk
 z0K8/Ts8e6MQmItBUr3K8pZ3ViV113w+kginz5DdIOMNCnMjVCafrvkJDqKBgOwQU1Sg8nqFVtY
 HrHKUUPFOUffb5uwo4nVXlD31ZKt+0IYSKGfeuyIQ/z97ydCIE29Z5uqlogQr1mcB81xkXOKqM9
 rUXuN4tHc9Y6HeRbRmGqJs62Z0kngci/2ZcpZP/tlWzeYPsh+Z24GffuIoXd/wTGjYuwQdx08P3
 iCDzdZg7+rToop82cpuF+vG215ubdDT+DJgGn8A3VVZLoS+4wzqqc5ClsdcUo00pA8lMFoI17X4
 mtYE7mj1titYMwujspLNYs06R/04d+Sn4VOxwPTaWu9LipwXRl9HhKzrcpiEm+P3cZ6E1nTE3v4
 6UOlfQ7/Z9k0nQP/jXzWfxdbWsUdtwZpyutgXBVz6TQu1eBQQpjwdxP0uEbAr4Et7QFTF3OB6tJ
 Nu2bSW3AdDXA8Tbr54A==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a60a28c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=k0yApWwVdG9Lq5E6IgkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220106



On 7/22/2026 2:50 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 06:27:28AM +0000, sashiko-bot@kernel.org wrote:
>> [Severity: Medium]
>> By splitting the link setup from the stream setup here, are we exposing an
>> incomplete read-modify-write in msm_dp_ctrl_config_ctrl_streams()?
>>
>> When MST programs the link and stream settings separately,
>> msm_dp_ctrl_config_ctrl_streams() will be called independently. Looking at
>> msm_dp_ctrl_config_ctrl_streams():
>>
>> drivers/gpu/drm/msm/dp/dp_ctrl.c:msm_dp_ctrl_config_ctrl_streams() {
>>      ...
>>      config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
>>
>>      if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>          config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>>
>>      tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>>                                            msm_dp_panel->msm_dp_mode.bpp);
>>
>>      config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>>      ...
>> }
>>
>> Since this function reads the register and bitwise-ORs the new values
>> without clearing the existing stream-specific bitfields (like the BPC or
>> YUV bits), won't this cause bit accumulation and hardware state corruption
>> across multiple streams if the link isn't reset in between?
> 
> This deserves a comment or a fix.
> 
I'll add a clear-before-programming step for these three fields in the 
next revision.
