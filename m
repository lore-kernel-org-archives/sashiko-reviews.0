Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5337F00A
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358368; cv=none; b=djw+zEHa6cjnb7ZKf1NtYLtxmSEQElTdJ15OMmupAd13CHYackUTAOUZCquu+fG1it1EtUjMzImiciqSC+Chu+IO6417sL9aBBT3qsDlSbGyp0o8vB/ITOYYsCdj3MN0VjUL6haKlzlT/5FQoyQhniolk/HAYYQmuRLBCjl2GpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358368; c=relaxed/simple;
	bh=MIaD9u/FyqAx481M9oGITZCdlJubT9fxtimqMmPs3LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YkPk4JP1e6cP2Ak8vHQY9G7Wfy65urtoIlqXaJrNPgzwULdohmv/LWDwN0CU0uSsgRIZqjQKmDTAOp5kpYRYLOIx45xOzAOaFBZZsvcNLcl3jSy2ilfhqimr+V0cBhjVpOYhWyHksgYElF0n8YC1F/0FJmU0UveWq1LHaXPMi80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKtmteTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQd0pYGj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKtmteTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQd0pYGj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9RvAJ1727565
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0jOjMvM6k4d5k5fOvE6aikfLai4OHADt0EAzXaYhzM=; b=GKtmteTRzA2YjoKW
	9dPGTh1qeXym5u30RA7Rfq/Qp02KjAT1YME5rnMA/T+JSVEYgLpl3a4ML+8QzIw4
	6FVy8hxJz5qhA4R1asArSC0/aRNGEFJbkA1xK4XKChpEncySBn+AcxSiUM8QRQ9D
	3OqCNksoLKQYI7ZfB9F2fE1IPde/GZod2FWT85o/h9Ohc4lX+Q9N0RKbDlR4Q1tk
	sCS3s7dfrciUsJ5oh7+TM+gs1v+sGeDl5EU6W/yA6u9o6VDGNjUpfzBy4XDgW7ov
	duNGF8qjKc9ryZCE5gGYyTgOvhlrEnKEez3p5Oia78ArDjYbvyNtlOtth4D8LwMJ
	l0GWrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v3s1au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 10:39:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so16943821cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786358366; x=1786963166; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t0jOjMvM6k4d5k5fOvE6aikfLai4OHADt0EAzXaYhzM=;
        b=AQd0pYGjPFD8se70/V5MVEsrfzJPqHNUQOOAfrVtMCFFoiTz15vgegY1v+gF1LXTON
         /rgC/7z9LmRg5NLF5M0RRivLFQ24QPl39sO962rTKHHNKXStZYU1FAsZI0kb7V8JshPj
         h4xEtVh8upLFKIfTO0Rgz2RWDThETz6gHUciYZi/W8xqB0uhqQuqYOF68hky4ZQe+/FW
         mx189Jx6/DC2I/WuinvJRxbk9RtmeIjD52Pmg2nZn6QSp2Og8tef8BNxTooT0bur/yIS
         K/Qza586qEqVqcxFEKRf8shK8MY8YN7vILxmgbGZKuta28akNDXI0/d75ACTncjmY1ud
         ZBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786358366; x=1786963166;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0jOjMvM6k4d5k5fOvE6aikfLai4OHADt0EAzXaYhzM=;
        b=ZW+UY959EudFIbvSmPVsG2/vzHQ2ho/IDxlg+OFzFiJstF/VTobs2W+wCoyp95zrSi
         0SPUWUc8gQEvXZs2SvWBGPP+A9s4y8L2F0L3PmzOqBYkld98MtVMJtr7CiUQxplIqHcW
         2E9T2oKerexhOaD9Cwc7gm70UZSoFxdPRQ6mp7dYR7v+d+0iuKRiYd8ecS77JJcJf0z3
         0dBOJwOgn5SzsjLeeKF6kg65ZjGI3rQ2qD0qIg4zD6zdI0ppf6J8+Dcwn2QS2ZdvHnuZ
         8zt8kFX2SDMEbng4aVMogo0zkGzwgfwPPKjaBsqE8XX+0mYKLEPMs/V8G5u7J1r/Rx3n
         BpFA==
X-Forwarded-Encrypted: i=1; AHgh+Rqu+eUczX5ilM2kPtqRpjd4dvVLK4/17Cy0lLu3mxU/Ybvy6M33tFsABgOQXMU9b6ZPEUhE2APsSdDy5kU2GcY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx5glWB0HbPstd84M9GiCMqzVAiKeumlULM4tNc6N7tt500qzG
	rCxoqjQryOTNZsPgJaNz3nvuc+TODUkiuqus+JIpiL7OG23u0fh7gZaWv6aY06AJ7348TaWuzcl
	sWOYWQfwyNcsyzAXRnGQdNBhkdAMticPfhnYEuwPsLsgz+7g6I0LoA6AG6yZBA1suKGEVO/U=
X-Gm-Gg: AR+sD134kRj8rfyGyFC1fTAkzukjMycT7/Vb2MpHiertGwMgNcWecLr86xy5CAQqbf0
	IBumnvARjmaSvjQ1oZTqRz5PuIjvHDL1+4NEmYkVrmdMSZ25BRA4+R9FbBqAOh//7ic9eS+HdxP
	yX2lOxKj/Jj/ksHNSQk2WAS0l2By6z28zXudM0sJVbqQTJwMeNyIbo/iO8/wmQ/ctJQmX06Awok
	Kp+BT/6Z+TDXNKYHQFLiMWhubtYTFERQadxlgFxjTZzBA2IPLsvTCNAZgWFzJWP6S4wE6QC62/d
	T+E1UcA4Nod/vJqb/BZzoWxR5Gc+P/tZ43TuIQQVegFZsLr+exIK1ZINgNx+qWWRJXzJK/sWdKD
	EHNTSomL87COMnswSC4qBkeZqFE5X
X-Received: by 2002:a05:622a:148e:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52d20a16164mr201133931cf.25.1786358365785;
        Mon, 10 Aug 2026 03:39:25 -0700 (PDT)
X-Received: by 2002:a05:622a:148e:b0:51c:1bcd:5cc3 with SMTP id d75a77b69052e-52d20a16164mr201133561cf.25.1786358365392;
        Mon, 10 Aug 2026 03:39:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145a2bsm33792385f8f.4.2026.08.10.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:39:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Junjie Cao <junjie.cao@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Grant Likely <grant.likely@secretlab.ca>,
        sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: ml-ioh: share the register lock across channels
Date: Mon, 10 Aug 2026 12:39:21 +0200
Message-ID: <178635834342.23392.7784493925517390705.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804095935.2132215-1-junjie.cao@intel.com>
References: <CAD++jLkAjQG7hFsdX+dy8wZUoKKDCaOzMD0EJ0nn3gYmaEOJDw@mail.gmail.com> <20260804095935.2132215-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nQdebfuGKTqB963uy7BSon7eDuE43PXg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfXwGdEWmzbmGq6
 5XuYQZuUBiyKiwvNVMQFGSd0lWNe+0LC+0nqtvjzI/J1RSBE9c3UOxN19f3mbnGrSbfpGCYchW8
 zXXVXSeEG4Qa17iRS/b5FCsb06dG05e1aX1uVFRxI3KkcEYpFhA6C9WygGXrFWLloDWs5/Eg4oK
 fA6GV27hl25a8Z7EufCZxmR2uZsMTyzqg99HJnhucieQ9ZnXB5VqM01fc2fmgXDOEYbPMUdrwdx
 q86zT9duDmo9hxqDpsOJ1LXHt2+5Vzc3kmDbA33eLCmhgLCzhOg7qRx/r0HuhdqKaWYBgVC2OJd
 s4A54KC/s9liZPAbEQNvIjA7ciOlARskMRkpArngpd52ryCBFvURm2B1MdqynL1jtG68I6CvSFe
 veIAewxbmT5mIQrtXPsg2NYFbIlL9LKPCejgDUR7RqEJ86r8+vf4UzwWZK/wlk+ZipCjUOw23gX
 uxO0jPrjPTNCgckSLpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfXxYV1noexXj/3
 PWqsT8tu5G0ivP6j6DIuXqgEDtnyAqNS/35j1UP5gxwMryz/10YYlYUiRG2UNf/1uaVwPkeKPrp
 DqypGmI4PnDIi0bjWFjKKdXXdwDoiSQ=
X-Proofpoint-GUID: nQdebfuGKTqB963uy7BSon7eDuE43PXg
X-Authority-Analysis: v=2.4 cv=c+mbhx9l c=1 sm=1 tr=0 ts=6a79aa5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EQEPRNam_Ll-aolYYp4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100092


On Tue, 04 Aug 2026 17:59:35 +0800, Junjie Cao wrote:
> Suspend and resume hold channel 0's lock while saving and restoring
> registers for all eight channels. Code paths using the other seven locks
> can therefore run concurrently with PM.
> 
> Use one controller-wide lock shared by all channels.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: ml-ioh: share the register lock across channels
      https://git.kernel.org/brgl/c/a9253ee6771c8ab3c6de07ea75d9e2c1cef3cd97

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
