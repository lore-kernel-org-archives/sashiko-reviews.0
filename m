Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87240480960
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158665; cv=none; b=ciOaHYxwLDbD87JdxZpY3KeQt7bAtS4qyJYORJT//em3LfoHC02LArKectuJSErfMvzw9DTgDsM/24VgNsD5eCIH2TM9GyuISBacZyNlkCZSywqbvD2mVBZPECcFfYRU3iP6AUPk7CKEe8D6GAKGiUL5S9WTwT8UR+tUVFEQ6CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158665; c=relaxed/simple;
	bh=i2uXn1FZn3BvlVrPjw6xo0wOO98Iz1Tsnj2g5Q160sQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRVjFw559t8H9lgQ1Ln4S2CkaT1wJAIX7bovXBsbyCu54904yiI8e06zEJMEDw73q2uOYuE3er8lkAruhIgjullV63akW4VxBLQsucMCZqGhZAXmJAn97esLtLdF7pB4dSl9mfjUqGp9M34iPo05mNLfca3yUvhfs1uar7urL3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfvR76lN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HO93N3ib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfvR76lN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HO93N3ib"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3DrD2262150
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=; b=VfvR76lNEn5TIM2/
	rf/KJaE1U27yn8qa6ciwpJ3RG30BybSEv0nlH/R8XTh94FWRMsq57QM9o1FK0xl3
	v4yBb5yM4a/9kE8Y2g7S5Bhr7FLDYPkJr2XtX8EOF0y0p1j67+MMXYyxpAl8ERH6
	XV8ezETpocxLF0mlxFRZSDhjscnGpgD3J3x5lqCP8hqY++7NOeP+yRM2fgg7pHdL
	OTj3ohzxRH+4qh037rN8RCccRfyz7G4ksOVvNMMrJWFxggZ3ahIH8SEo2qur/6Xe
	pQ9D3QDH8yx/K45spa3Sv3mOjHTratO7bnhdHlznOMML+bwYsHPHkaO1QiaeVgf7
	eExUtw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3g5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:17:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-333543ac378so861658eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158657; x=1790763457; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=;
        b=HO93N3ibKo112fJXLkg7W+JrZntniTiHE0UPUe+o28ANiGpwfgd60K8FObQnkZISt9
         ZJ9D8tpTYL9CCVaXeuIjcY27wCgooXo4tya56CxdZJIS1ZCkBtIePhJrDITsja3fDhb/
         Gb8gBjkf0rUJSZS6FXFI3v8nMoMSkCvJ89Y6ZGc5KBqtUr9hl9PfrTBI8tlab9s3kmd7
         sYwGV5+aVMPjTPHpb9Mr8qKW6OTxGVACvc0BFg2YheihXNZuSQlffaOxyKtnkREFV1xO
         yYRUmEw1SnRH4IUDSEhUIFKBqED7p0lExz98YfYiwmcLNwooF9yOweg2+JKBuByH69rX
         xVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158657; x=1790763457;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOfaOXyLxTawKWxy+e8JIKZP0tYzvj4caG55Cg4arxc=;
        b=w+FYxFmL41OOgxm17vOYd146ttYtAs8MjlroESQooV+b8JOU8siovwGnE2toEX7wwU
         cLK6KCYrUxh3XOB1xrfhQHax0iRvFC/TmAyxEmwjCw/5TGlocE0oX880HSYqjBsXPbkY
         /h/AKzoowhAKGfVkBxWhtV3+y6hw0SLL8NW/AnEQnwF02CUS2rbFClCzevSi4O9d0m7j
         CkEi9smNqfm2+2Rb5nhBkUqQtGabWr0ME0BmdLl5yTsbXuMn2EFt4v2uMFOPB5ewPPOW
         5BWRxdsWcDdl7cSnMum6oUMxLmSpxiv6EFgz+Z2hW90bQWqFn6+qbwwHN/MYBS9loU5D
         Upaw==
X-Gm-Message-State: AFuF++m/PThcqcrySZp01y6rVsKgxQVT803lVBHSY6M2Rg6RIGrxOxYd
	qzazytRYcmWIqCxjb9QBMmAiUoQ0slKsSwR0PVRPxWecFPvRnna9EPN40lnshspk/1ZKQe73Naq
	pjQJoNvNLcltzODIPtdh6WrFgBFVNqrjd9hImXxDcqnzz4SQo+frS1zTNX6RDzvmxbdDYQlwIAT
	2tbcM=
X-Gm-Gg: AYBFou3StX2HraqM7TIH1tG14X4ED0TdGvdzgD/A9NGI+ppEHi7myTD891iuGQuuGs+
	nwfX4RweljPJmNLcLMFFZ8Eb2SPv0baWPF+7R3QWk93y89ZZHA1FCGpNYmBQyP1XTM446LAzFET
	y6l6iXIYzM6wkzMVPgrwUNTTk0Bj8RqhQZfjdDXX3U3Wp6XYkLqI+lf2AK95CAHJlpzQGZnTXV3
	wollgjZ0mYOj1FrY/J/J0tfB4fdUtnh4LCm94C/0VSy6gaGtjdg+nX+6kjL9Or2gAz+78h+Z+E6
	tyJVVXvL0BaTsa91aVAdQf1dTn3H5D/qbIveXU5+D+6NntD1nKKDFj+o17VsDMQ4V0YBBdx88XG
	WD5HMkK2uQaE4eAO3RzXLX4bke6nd
X-Received: by 2002:a05:693c:83ce:10b0:33b:7fff:dfea with SMTP id 5a478bee46e88-33e8c05848cmr2471929eec.2.1790158657059;
        Wed, 23 Sep 2026 03:17:37 -0700 (PDT)
X-Received: by 2002:a05:693c:83ce:10b0:33b:7fff:dfea with SMTP id 5a478bee46e88-33e8c05848cmr2471901eec.2.1790158656501;
        Wed, 23 Sep 2026 03:17:36 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fdd91sm5885830eec.4.2026.09.23.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:17:35 -0700 (PDT)
Message-ID: <3a25c942-eac3-4079-8ede-a41f45962499@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:47:32 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: qcom-pm8008: Add PM8010 mode support
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-3-de33d78fad9d@oss.qualcomm.com>
 <20260918165258.9FC791F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260918165258.9FC791F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xVubBlEiN-dXEx8132Kg9KL3f7qamWyX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfXxesWJjIDTgOZ
 snGIuyQjeFk4NY7PpCGedKjKP6nJJZgP6kLq0wKFl85pThgDXdNuwAGY2+RQMD9noebblu0SmHA
 pSxfnutjMZx/ZXLCUP3RdVCHa5HR1Ks=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3a742 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h15mIm_vO2ZwhMLoIH0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: xVubBlEiN-dXEx8132Kg9KL3f7qamWyX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzOSBTYWx0ZWRfX4GXBupnOPLfd
 p5bjSYmDYxrM/3N5tVF5OrClDTeN7yGWMZo+FEeRfRosdDxeRCtCJW8QNZi4/8XQ3r49/upZI0F
 xHksKRcTVpSLc4c6of70Q8KCw7mcsCNhnEZm3QpKNXhaefyYN5r99qla0GwCdMBrN0REVKX6LVH
 GTFoqm6IOUcsjKcoqYTPpDmgBTRvKQmj9eOPXNk5PWOC7mOx0cckq2b5gv77Wxf2Q6HSfV7BpSD
 1iFtJKHkHSyn0AYu3ecHqsdyYZljdap0OgNgA+Uz6y1HSt9Nfa8ASBjJs0O9kupy0NIhYL70SJk
 9Fb4OXomLa1zCs6ZavsSipU1N9AOlizCYrqtXeusZ1sRU7W+C8/ujhnlnZHJqqXF3WmU7f/PcHd
 dUkiOjlV4wSQiz71L9ymxyP8byYW4L+y2E5TOEsEG951epSz2huiKWfzsWs6vF6ijdecddfledL
 d8bnWE+IDhjQOZi9CnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230039

On 9/18/2026 10:22 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] redundant use of to_i2c_client() when accessing of_node
> --
> 
> commit f34c6623337a92a1f38e24ae60d1ae6ced8eed2d
> Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 

...

>>  
>> +	is_pm8010 = of_device_is_compatible(to_i2c_client(dev->parent)->dev.of_node,
>> +					    "qcom,pm8010-i2c");
>> +
> 
> [Severity: Low]
> Is there a reason to use to_i2c_client() when accessing of_node in
> pm8008_regulator_probe()?
> 
> Since to_i2c_client() is defined as container_of(d, struct i2c_client, dev),
> accessing the dev member of the resulting structure evaluates back to the
> exact original pointer (dev->parent).
> 
> The expression to_i2c_client(dev->parent)->dev.of_node is functionally
> identical to simply using dev->parent->of_node, making the macro usage
> entirely redundant.

I'll make this fix in the next version of this series.

Thanks,
Jishnu

