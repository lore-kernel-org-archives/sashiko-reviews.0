Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4940D59D
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781836238; cv=none; b=Cpw2Yg+gn6PFkTaH4z+uEDHs8KhVYf6X8FeUqXYgEW1rHcHlEZA2BIuYdeYKQxEka/nMvOlJSLIEBA9YA35CQeq0wp6ixF8WMUT85bK2g+lQDIeDkjH/h18THJUTrzS+zxd2TTHt2TnOVh+YlR8BneDUED2q5P4BeQaFoLwXVTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781836238; c=relaxed/simple;
	bh=hzzDKg8D/eWtuukadeudzxtQLfPsFzWFYfc7KtnK090=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcf51OVH+lIa/cUBeyODLwnxZsRyRcjxEjbz/oEuQAeP0aD73QU/PY6ciZ0htop2xDEO7Ntz4rtyiXF4iYcfc4YyDLqW0o94K7DQq1vTG/hxaoTkHpYhcikDNoNMSUUJpPuXunxivdEFONQk6pPAJnkdkRmBZhhdTcSOh25TnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwAVZijL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BR8p0HFT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwAVZijL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BR8p0HFT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ILs1kc1034573
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 02:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvKvnxQYSohEoeYt3Cgy8DUpe1X/VcVG3995iHk0UiI=; b=RwAVZijLZ+dhxXOm
	MeRyqdbOwdmbMtq5/1eXRdknBEkDh/VP86knWB1XyJ4R3o5bd3qYN7dXUOxKKo7c
	EGy7XwkqtxjL96ea8bA6VB/6K3HtvBaoISlsYnZ+P/Qyb567+6D3s07hg3c3dMkn
	YFZP3qQSuuKU5WA+VkLQ03mas3xakMP4jvfhgNF9A38XGWcmX9vS6pE04KHLOTIl
	J8OcsYz7RJ/qWHnM2ZFHIqWHOtk3ET999pyAO8/vKkTBGmccHw746KAtT8xPtSz1
	NnrWqZVcaOdZjnaVWQFrZYR+Ux6zqsCM7gIODMCG3xla0P7qrtmXBEyZ3v7cS6Pk
	MYyrCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evmyr9wtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 02:30:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c5dfb67b7so1890647a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 19:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781836235; x=1782441035; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rvKvnxQYSohEoeYt3Cgy8DUpe1X/VcVG3995iHk0UiI=;
        b=BR8p0HFTSs6FT43uSn5QWO6EWyA6xoiq1HuAo79uLfbW48MXfgEKZPX2AMhAEGHOEQ
         DqAe/jkYZaTkXbpbhqWy/L+XvWSJ0S7e96mwFYtEjlCdNUoko+XSrXBfJbbIRRc1m5q6
         ARxCZv6g9ShcJwHVL8Wjq65dUwTOysG4nJ35pCz16mTwuskDDg3GWEZWgDAHj2fuxESY
         Eh4HvYqflPxaYv8OUWTqxn/1pfAPe3FXRc7BxJpEKHJqQiA8WmJT+sY7Mi/wPW053ZwE
         x1O1suetvVMuVquaO5ewvOQzEwgAaWRTmQOpmcQbthhmsfNruiLfGESMVRjWgQ2l4Itk
         J55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781836235; x=1782441035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvKvnxQYSohEoeYt3Cgy8DUpe1X/VcVG3995iHk0UiI=;
        b=p7kA2Lp1VT36gbOVfLS6Hrpgl+n+/+Df2sZGwMW3i0uXG0ARKoz/DVQA2HlgOKXCKG
         hdp7pi50vqGcs/5hcEc1PRfZPPI3H4JXizQfXlIvJo2qhcapUlZQUfKCCriFNqGasGpY
         nCTUskhUzVVN5W6lfrDUGCyWcgLuUbhX9Lf79ndbK1538MNVC7WpBZNxPlW4PJ7Ewmrv
         UXiWN//ueTffRl10HNhwLS5cpum4RZueQpwLJMC0TB58YAGnzVAqjSPC2Opf6gDcDgMp
         xwnP3M2VRRwPaapEe3+9zghKZwzZazxngoMaiPmG1PIO8YchBWN5CQ67rvJYJdGXtgkr
         0omA==
X-Gm-Message-State: AOJu0YwSb4dRXuvnzqCp65XgR4bucwhlMzcc3n33m7Je8Y0nq+fuiCzn
	03CnS+2iuFnVtm/TcviJp65+Ry7B/5s6CmJccth9CD0WdIOJ6v0iluGUrQM7rUYLktAFlzPJ1ub
	roc0UnLeA58HPu1Sf6LslIWqWHxVIcBaOCTKK5BF2DchWgCisJcyUjhsz7F2DC93av0PFrcQiDf
	rdJ9E=
X-Gm-Gg: AfdE7cnqco7DxRdXl5smOWfx1pYnx/gOuy3Sk9bX2ihyVVUW9lYlmPYDK5YRKXZfrwh
	4KwgghRhVePC/fkWolsydsbEtqpbEdtVVMN5yd3EvejEghFb7na20ogvGWQi8GiIPUyX59TGB6Z
	LHfheIh6ZJ0dhoz5SHEYK2bntEVAxPAUKft3Amg/TotWDFZpU1Ii+QntHHiRvD+V/SHQyTWY8+9
	Ejyg1ygywxPC01pVbhshlit4o4ki6s64FUQ8VRLlLSuEMUpy9/vtycg4APZScepXcWjrNEPa5Z+
	O7jkPtAsbOUZpamKYHdp2lKr7cKi1g994E5cJ8XorlX5MDEs3mz22VuePPGEtgf6luc4KdZjs9V
	DT15VToD85mJKBWXv6mXPxi/tYBzHH4Pn1KtD4Ifh9CgX1f2Cc+Fv+i3FZV0aW9vg6k7rEK7rO6
	c=
X-Received: by 2002:a17:90b:3b47:b0:36b:bec8:94cf with SMTP id 98e67ed59e1d1-37d15dd8eedmr2113730a91.9.1781836235362;
        Thu, 18 Jun 2026 19:30:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3b47:b0:36b:bec8:94cf with SMTP id 98e67ed59e1d1-37d15dd8eedmr2113644a91.9.1781836234461;
        Thu, 18 Jun 2026 19:30:34 -0700 (PDT)
Received: from [10.133.33.52] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15de501asm1049045a91.11.2026.06.18.19.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 19:30:33 -0700 (PDT)
Message-ID: <c71af930-c7b4-4480-b125-f35cbe35a16f@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 10:30:31 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: core: Avoid possible memory reclaim
 deadlock in TX EQTR context
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
References: <20260618140941.902000-1-can.guo@oss.qualcomm.com>
 <20260618142114.B61281F000E9@smtp.kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <20260618142114.B61281F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZWgzVtv c=1 sm=1 tr=0 ts=6a34a9cc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=eKUtWX0Il2Luia58cFIA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: sNuH7t6poPT92_yinatmMGWmjD78qezQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDAyMCBTYWx0ZWRfX9hmsXXj86RiW
 u46IXSbXgbtOeltH/Z8biqB/IF/ZBxwdUnQiyEDye4PVVmjdqycsqcIrTGQbWRIohfpRewHl2XX
 IW7i/DWdSjvPFcoj6QTEwfORGicLu2kRD4H42zO0bjLZkxdqQblrg6nTaE4PwWQjeS4WmhNUlPK
 MeHhfHbra/rig73aOFyXMSD/fNVwe8SgomhPPGMhW3KywKCd90v9doLOTfAdrg0trQjG2GHwVuG
 euKUv6bBnpXdSO5bQ3CsEO4nhja8u1RFBoVf2Ehti66+wfxCGstrrCKm03Ta6qAHDTpxKh4NxNn
 8VeWMcAPlo2mXqWbdUvUfRkvT9gEYnvrgULpgmw7xnsv1TMK1CL7nT0cNVLDAYGMJ+zPQVvK5UC
 L0jEkpM/h57BoA/ktshXbMQe1hwFYXmIqvL0gKn2ci0CDNCEw+zXCe1pmZ3ba4y4HvejxJGeGjW
 kSzIV1AJeu2aajCDaYQ==
X-Proofpoint-GUID: sNuH7t6poPT92_yinatmMGWmjD78qezQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDAyMCBTYWx0ZWRfX8QgJCPF8vDH1
 UPTU6W3485ojNJrPIyOvjK3zcD0oDzHryHWNXmLu5f/BvgVyafzU4CzjH4OqMvg7bnVDKtmOz13
 Y8H+N4zodptv9I4i/npLPYghftnyqNc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190020



On 6/18/2026 10:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] The POST_CHANGE notification is skipped on error paths in ufshcd_tx_eqtr(), leaving variant-specific hardware state unbalanced.
> - [High] Missing cleanup of TX Equalization settings and Power Mode on error paths in ufs_qcom_get_rx_fom().
> --
>
> commit 8d8593416ad1701fbb78203bd1a0efec4ccc4895
> Author: Can Guo <can.guo@oss.qualcomm.com>
>
> scsi: ufs: core: Avoid possible memory reclaim deadlock in TX EQTR context
>      
> This patch uses memalloc_noio_save() and memalloc_noio_restore() in
> ufshcd_tx_eqtr() to prevent potential memory reclaim deadlocks. TX EQTR
> allocations in a quiesced UFS tagset context could trigger direct reclaim
> depending on UFS I/O, leading to deadlocks.
>
> Closes: https://sashiko.dev/#/patchset/20260615132834.2985346-1-can.guo@oss.qualcomm.com?part=2
>
>>      Use memalloc_noio_save/restore() in ufshcd_tx_eqtr() to cover all
>>      allocations in the TX EQTR call tree, including:
>>      - params->eqtr_record in ufshcd_tx_eqtr()
>>      - eqtr_data in __ufshcd_tx_eqtr()
>>      - params in ufs_qcom_get_rx_fom()
> [Severity: High]
> This is a pre-existing issue, but does ufs_qcom_get_rx_fom() skip cleanup
> on error paths?
>
> The function overrides TX Equalization settings via
> ufshcd_apply_tx_eq_settings() and then alters the power mode to test the FOM.
>
> If ufshcd_change_power_mode() or ufs_qcom_host_sw_rx_fom() fails, it
> returns the error directly:
>
> drivers/ufs/host/ufs-qcom.c:ufs_qcom_get_rx_fom() {
>      ...
>      ret = ufs_qcom_host_sw_rx_fom(hba, pwr_mode->lane_rx, fom);
>      if (ret) {
>          dev_err(...);
>          return ret;
>      }
>      ...
> }
>
> Does this direct return bypass the restoration of the original TX
> Equalization settings, permanently leaking the test PHY equalization
> settings into the hardware configuration?
In the initial patch series, error handling was not the key 
consideration. Later on,
this has been considered and addressed. After proper (error injection) 
test, the
fixes shall be submitted.
>
>> diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
>> index aa64f2bf4f1ef..d20c478659157 100644
>> --- a/drivers/ufs/core/ufs-txeq.c
>> +++ b/drivers/ufs/core/ufs-txeq.c
> [ ... ]
>> @@ -1248,6 +1260,9 @@ static int ufshcd_tx_eqtr(struct ufs_hba *hba,
>>   	if (ret)
>>   		ufshcd_tx_eqtr_unprepare(hba, &old_pwr_info);
>>   
>> +out_noio_restore:
>> +	memalloc_noio_restore(noio_flag);
>> +
>>   	return ret;
>>   }
> [Severity: High]
> This isn't a bug introduced by this patch, but does the error path in
> ufshcd_tx_eqtr() skip restoring the hardware state?
>
> When ufshcd_vops_tx_eqtr_notify() is called with PRE_CHANGE, it saves
> critical PHY settings. If __ufshcd_tx_eqtr() fails, the code jumps to out
> and skips the POST_CHANGE notification:
>
> drivers/ufs/core/ufs-txeq.c:ufshcd_tx_eqtr() {
>      ...
>      ret = ufshcd_vops_tx_eqtr_notify(hba, PRE_CHANGE, pwr_mode);
>      if (ret)
>          goto out;
>
>      ret = __ufshcd_tx_eqtr(hba, params, pwr_mode);
>      if (ret)
>          goto out;
>
>      ret = ufshcd_vops_tx_eqtr_notify(hba, POST_CHANGE, pwr_mode);
>      ...
> }
>
> Since POST_CHANGE is exclusively responsible for restoring the saved
> hardware state, could skipping this permanently leave the PHY tuning
> registers corrupted and prevent UFS link recovery?
It depends on what is implemented in POST_CHANGE. But this is a good point,
I am considering to mandate the call to POST_CHANGE. If there is a 
change for
this, the change will come along with the one mentioned above.

Thanks,
Can Guo.
>

