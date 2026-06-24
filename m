Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D761A9FB0
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307878; cv=none; b=R/vnKx8COyVg5ONA+rDpZiXWJurbCA3FH8Vl9MBpLwwE1+4/MHV2bffeMXcWNV3bKxvOn7sh6Aha5/8aU/lSmQZwZkWCOSu+1elqo8jwcB7yKL/1uZHp6c6UKgoTvgKse4T9eIlvzTIP4J1xsHOeU48L0dbF8P5J1D0dElV76sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307878; c=relaxed/simple;
	bh=p68CpGnxGyhI/fzAM1TyvEKb0jamzFVRALJYl6w47Wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8tJa8a+tP/vwi9Ht7D8bpYVNx4z36BVe/cpIZ14OvhCnUEeDFc1ZBGdXzYnzEh4NGU0+GfA4rQ9k8xTLXAkCY1PtNvqA390WhTgJstIGUpJVZ0jSzX0TiDOwNJ7VL8mekRTrhp+ssCtIxVThbbgffvkgVc1fA9lED8Od5HeyX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lcYJtdRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqSR+WAQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lcYJtdRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqSR+WAQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAO97w2845982
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmgxxMOLKanyQxux/RLrDVM/FIMyBx8HNKmxCp6pXzY=; b=lcYJtdRy8wHjEc65
	RK1n5W8oPVuYhdZH1msntOIjVtmEYMo7OzVjD3mrAL/Lg4a1NkxOdZl36VF03p8H
	4tvePZiRglHbFO77KW3N6LV8wKwrEF6fqSwERlIPwbybxtrCbacFaSsW1Dn0x+UC
	FP5Sv2g3WmW6gIQuGRmANrBivHoI5inGaE/HX+tUT/NsijWhRYLTqxONq+/p6bln
	KCTK/YQmR6qDmTs0XupZ7KrlCP5uULNrywYk2McqqWyFc9/Uhw+/+K1GefbKAi6d
	2F28MD0U4Nsd3odxC3mLLLcd23OrHOlguTeQlzL38AN/U7FQnQkMSrIORa0SGlAZ
	S5bBUw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p3c2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 13:31:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso483695ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307875; x=1782912675; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmgxxMOLKanyQxux/RLrDVM/FIMyBx8HNKmxCp6pXzY=;
        b=QqSR+WAQ/HnjX8+0vtulkfisoSSFxR51l5TKGW2vn0sYRImQmvXDV5GPaRqi/9mH/Y
         J7Z1ObDYKKOaVwOqFr6eXUb5nYMOoAZyIR0qfCjYCFmJg4b7i0OdNxFTy6LyD+XJ+EC8
         XqGlZvXlw5a95Q4s/O2wK8cEEui3iTnSOhj11s9Mzy18LxhNS3A1n3PHGmAKiLkBWEgU
         hSbgyCNrZMp2izCfsXXwpMrZffB6XffzXOeCtsyPAmYRtfxfp1IfNnbR0R5ZdHzieRE0
         X4Z5IgSWV7fo277YBfsWuKe2YCjl02Wm+Labo3VEFzHHPNBgwiNz+d6javcKHf0z5xXL
         n5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307875; x=1782912675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmgxxMOLKanyQxux/RLrDVM/FIMyBx8HNKmxCp6pXzY=;
        b=LDE96QGT3VJ9iOWorpFIhgxSLSy9GKwsFOZ0Bk8raKGl3nf+j+rZGjJeiACyQ25Oo3
         ci8IYbJJae3fJM04Ipp+o36wyu0lsEI39rNTic2/jlv7fDIKtSPJlZGuxUBRz9gOCCkm
         LfuEjhedfFaF8n8m6KsuiPsuFopOi+tMO6zMjgQ2lBbD++Vepc0ivyxY5iyZ+rUI9pIM
         AwzWsmILL7wUhy4TRhBfztr8bS3Fb7ZUON5LAbZ0fp5it7u0jnaJ3HJS1snh61SVxepH
         UPbEBZptfha2dhf3222rZq8+EIDoK0PA499ohKnM5aZtHjzWV9wpiT/Ei8l9mUFOpSYG
         NuIA==
X-Gm-Message-State: AOJu0YxpgWQ3p7VoTBUwmdBXgaJqghjsjmBzcs/l3z86IfAmoBu+Mf2q
	n2CdmIIs3g9KQoR2i++RcxGl0LQ1pC6NjWh2LEvg/3jK4kPSeNsiHkuFn3iodnYCvtthDIKuY1h
	R36hA87niRvZvWu/0d+9XXdetZ/6BU7IIn0lADnUNQwBP2UGgm2NKYSyO5i45eTaLsTCNNPULAb
	iIuyY=
X-Gm-Gg: AfdE7clukzIT0kE1eFqGH/u2SkSkDhTue+7tsDTxd7hqjc+jAYhQv26n0JEDmseY8K0
	yyecd5Oyul455YyqlVY1gA/pRIvw5Dj3HSJdrsFaIOaZFTsAh+RppQkuYkdV5EbTKntTzjvnDb1
	Hjh/ZYJwPUTEsCyguzLk9XPVcKlOXdup7KllvKXPk1w/nGXGYg4JORn9ZxHpJw3RH4C+uvtLeTr
	Iv+veAfogTWLp6fDiZGCmHj2pfx8AJ82ZPiVq75XcvrrAA6wPsB0J/AfGtoSGtIOxZnohQeG1/j
	bGSzUhr6ZQbfwdkd+E4jqQErTP9WDUcvdIkr0yRuNzKgmGcU0sAQJ5ukYiSWdJ0HZZdfLwRKCYE
	LAvKq1MN1bRzhsKtjSMg7Sq6VSyHVNMzahaDE4rp6apc=
X-Received: by 2002:a17:902:d2c2:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c7e1458148mr35429625ad.5.1782307875314;
        Wed, 24 Jun 2026 06:31:15 -0700 (PDT)
X-Received: by 2002:a17:902:d2c2:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c7e1458148mr35428915ad.5.1782307874569;
        Wed, 24 Jun 2026 06:31:14 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm137894045ad.37.2026.06.24.06.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:31:14 -0700 (PDT)
Message-ID: <39e14aa9-28dc-44b0-87fa-0ca74a3fcd6d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 19:01:09 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] phy: qcom: qmp-pcie: Skip PHY reset if already up
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, linux-pci@vger.kernel.org,
        neil.armstrong@linaro.org, olteanv@gmail.com
References: <20260521-link_retain-v2-1-08ed448b081c@oss.qualcomm.com>
 <20260521132311.4DE411F000E9@smtp.kernel.org>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260521132311.4DE411F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMiBTYWx0ZWRfX8dkoR108Gy/4
 BFR5qKQt2QWOa3D/0Ybvsnu0uORfkgjb1SSAQLkNsQJh6SyzT956OrE09FGjR0PR0Qk30PLG/Ey
 fmGiCQ8jjvROmiU7p2aTLfcYVFue5wI=
X-Proofpoint-ORIG-GUID: ZXUN0sQuohynPOIgPxxdsJc_tBbhgoXH
X-Proofpoint-GUID: ZXUN0sQuohynPOIgPxxdsJc_tBbhgoXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMiBTYWx0ZWRfXy1KW45AmwKC3
 LP1oAndoFcRz2aC4/DldjhOgvyfe/Zvxa4Fh4pPSTmt9uLY5TyDpOxuPl45uOLffu2OXVU78SgS
 ExTnvOM9Uv6WVjjnySR3SvkgtuiBgFvLbmtsejMixMdTCGh8F0KkAAFkm47LEgDP+WiwPx413ly
 pNaBnUVEjyaGbolfrLomS6q2fgsOMaKpkHuiCEa4U1pR1S7yz0MmmP17PDyyNs1/TUMQ+M/SZB0
 l/PeE5PpjdRmDqH33383q7ixQlt59hn/hyJuZghWPU0nojToX1I3EKxrVqRXj9kCQMz01/M9l8s
 mbx9sUm+QcNPs8c5Dkybg1kkWAI9qcyQhVM0UaDxvUDoTKCVtwxF+N623MgjdtlDbYQ+/RwzNFl
 rZf28Q7e7PBAr1jcXPRIqMu9E5o4xdoaRcX7Tsnvv7MOJ2b4tgQ/5FUE1fm/+CmHW1vNE7L4N5j
 RANMM7WytOci+YztB3g==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3bdc24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=brcwVlbegnbOBPMMvKAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240112



On 5/21/2026 6:53 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `skip_reset` condition is evaluated twice using a live hardware register, risking unbalanced reset operations if the PHY status changes between init and power_on.
> --
>
> commit 7deef03fab352fea4d882c35e253738b3fad392c
> Author: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> phy: qcom: qmp-pcie: Skip PHY reset if already up
>
> This patch skips the nocsr reset during initialization if the bootloader
> has already powered up the PCIe PHY and its status indicates it is up.
> This avoids redundant initialization and link retraining delays during
> boot.
>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index fed2fc9bb3110..1458ac1478c7e 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> [ ... ]
>
>> @@ -4744,6 +4745,9 @@ static int qmp_pcie_init(struct phy *phy)
>>  		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
>>  		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);
>>  
>> +	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
>> +							    cfg->phy_status);
>> +
>>  	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
>>  		dev_err(qmp->dev, "Init sequence not available\n");
>>  		return -ENODATA;
> [ ... ]
>
>> @@ -4823,8 +4829,11 @@ static int qmp_pcie_power_on(struct phy *phy)
>>  	void __iomem *pcs = qmp->pcs;
>>  	void __iomem *status;
>>  	unsigned int mask, val;
>> +	bool skip_reset;
>>  	int ret;
>>  
>> +	skip_reset = qmp->skip_init && !qphy_checkbits(pcs, cfg->regs[QPHY_PCS_STATUS],
>> +							    cfg->phy_status);
> [Severity: High]
> Since skip_reset is evaluated dynamically in both qmp_pcie_init() and
> qmp_pcie_power_on() by reading the live QPHY_PCS_STATUS hardware register,
> could this lead to an unbalanced reset?
>
> If qmp->skip_init is true but the PHY status bit indicates initialization is
> not complete, skip_reset will be false in qmp_pcie_init(), causing
> nocsr_reset to be asserted.
>
> Once the reset is asserted, the hardware state changes. When
> qmp_pcie_power_on() later re-evaluates skip_reset, reading the status
> register of a PHY held in reset might return 0. This would make skip_reset
> evaluate to true here, skipping the reset_control_deassert() call and leaving
> the PHY permanently stuck in reset.
>
> Should the decision to skip the reset be evaluated exactly once and cached in
> the device context instead of reading the live register twice?
All the resources are voted by this time, so this situation might not happen
at all.

- Krishna Chaitanya.
>>  	/*
>>  	 * Write CSR register for PHY that doesn't support no_csr reset or has not
>>  	 * been initialized.

