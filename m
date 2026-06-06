Received: from send239.i.mail.ru (send239.i.mail.ru [95.163.59.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA2B78F29
	for <sashiko-reviews@lists.linux.dev>; Sat,  6 Jun 2026 22:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780784500; cv=none; b=jjtkVk17LhFhpSfUiMHR+RocSA/gomGrB7XMS5WxgSdEs/sqh3dKyrPGsWJCuVr4cZzCaTysxrtMo187copFsC6R70KnoV/V0UTuQfVKvl6Wy2dBeGr7IXIImoNsxwM0A1L3sZpy7OaAkNF8i5efI7/ciSg4IigV/CFffwZX0g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780784500; c=relaxed/simple;
	bh=yjDx7FMJLW6kJNsqnJBfhGQsyKW5y3Q3MzKirdcrUSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFvyKzTI1otcf6VRmpHbQhU5sV3mhGuh12RcVdsPhEMUlg/m0kgxs1OFMbG5aWlXVRK18LIXZ5xdhixW7hSjwdJkg2rubFEPDc3/cvCljxXSe6m9z4Rfzxd6t7vyI8og6QqbSCm7lvR4LtqJQTfmJCsgLbqthWgcvC9ODZmFFO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=HGZJPpQ1; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=WSKWU8TD; arc=none smtp.client-ip=95.163.59.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="HGZJPpQ1";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="WSKWU8TD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=mP89QG16QYZU0XizrgGZUIz9phS/Opn8XfK6Q7AM4uA=; t=1780784496; x=1780874496; 
	b=HGZJPpQ1aCBes5YoJqUHf62YNBEPlcIokJj0njSQwGR7Zq7Ayk75E3+ucE6HuSeLoJNX7ZK/slw
	Ghq8dWupoB7QcaCXUJ/xAfYs9M6GhKG4lDg7tbUgTd2ShjYCG51yo5GzOIaW1K4XvpcmsmnLX+CFs
	aMXSHnrfNlQlyowKuTtmmSS2kA1EVpVr7qjKLTVMpDA0sj1/eSzxdFOci3IiT8MRyvnZ1NexvIV6R
	4K0oMxiDsBjg5/IpU/gN0ENlfN9i/FZMmqSXk51CffC0PSWFFQGor0d/0XZbT9atQ5iaIXRodGn7O
	jpey3k0Ym4LioC8CAunxic8xMrk2tRyC5XVA==;
Received: from [10.113.198.179] (port=37184 helo=send104.i.mail.ru)
	by exim-fallback-8699f4bc65-bhmtw with esmtp (envelope-from <listdansp@mail.ru>)
	id 1wVz9v-00000000UFp-1G3F
	for sashiko-reviews@lists.linux.dev; Sun, 07 Jun 2026 01:06:27 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	Disposition-Notification-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids:
	Disposition-Notification-To; bh=mP89QG16QYZU0XizrgGZUIz9phS/Opn8XfK6Q7AM4uA=;
	t=1780783587; x=1780873587; b=WSKWU8TDpgAoiXR2JrrfLQT3pdVc8237tqbhLbzSz5/HhUd
	RqPbQpoFBkelPTfckZ34M5qS3qSSCyucQHi0VSdvdxvSYw/1tBukZKBQQoT17s92h4aUWIRkQKa5X
	bk0xtVLhKLrHYNhM64npl8zLvCbmUOBNtkxYj91rB6Cep5pw1KnWoYCYlNrbzkkF/QynI+zy/3j8/
	jBRICn9sP7B4qNVjzBf9ZOEiwnVjy4PkjIB4xs2Va077CVXDRvQcG2xHxypszSOW27+VbdEzAc2Uc
	r4DeyfL5jMZWbsLZDZjflkAROEH6SAbCDI6h9qfETsfImUT6n6FE7LVCBPeYcMOg==;
Received: by exim-smtp-85dd497b6-lj7c9 with esmtpa (envelope-from <listdansp@mail.ru>)
	id 1wVz9m-00000000GwA-0swg; Sun, 07 Jun 2026 01:06:18 +0300
Message-ID: <e11ed4a6-1882-48b8-a177-cac4fce2867c@mail.ru>
Date: Sun, 7 Jun 2026 01:06:17 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Validate max_fclk_mhz in DML2 policy
 builder
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260606212503.140638-1-listdansp@mail.ru>
 <20260606215013.4D7911F00893@smtp.kernel.org>
From: listdansp <listdansp@mail.ru>
Content-Language: en-US
In-Reply-To: <20260606215013.4D7911F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9FAD06046D747065B958182259921CCB5B28B9DF39DB93621182A05F538085040076D29AEEDE398773DE06ABAFEAF67051133C554DE158315D2EAB06290505A20FB1C19767FBE8657
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE749E89BD568380EECC2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7E50EC9128971FD6EEA1F7E6F0F101C67CDEEF6D7F21E0D1D9295C2E9FA3191EE1B59CA4C82EFA65873317C0A341D396F5D03B9DA6973CF4F92C6DCA76C938DC76F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE701C05ED510F1C3F19FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637028599BB38096F4F389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006371F1AC37D75FB230FD81D268191BDAD3DBD4B6F7A4D31EC0BE2F48590F00D11D6D81D268191BDAD3D78DA827A17800CE77D6028A3C1764613EC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C037C7826540211F35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A593DC10E6B315826C5002B1117B3ED696BE5DA32377FB1237466072E6821086B3823CB91A9FED034534781492E4B8EEADAEB4DDBFD72C8FA1BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659CA01EDCBFC2A01711775A4B5452EA00C4FE2F30E5354A76FDAA771D5992AD3ADF033D13590098C1EB8341EE9D5BE9A0A2E4ED0D8C06E0207BFBB9232BE12446F24E0AB79442228E08CD93680B12512CF4C41F94D744909CE04437D853D7CD20871FE3B1D98EC473624A389F0E278DBF4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVRI2994ruhLUnp1S62S4+bo=
X-Mailru-Sender: 4CE1109FD677D277A25EA9D9B320DF534407A02A58CC0C4EB951B70A5BD4BD8EA28D906F4547E408E3F52FC5FCA1AAF6C53BD13D3F6EEB2F3DDE9B364B0DF289C95E31D8FCF52BE1594FB4C9F0DBF4120D4ABDE8C577C2ED
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B48C57FD6B8CC3B4246B4274BB1320747B754A7C2D77786D1268F3CF0E9FE49B6934B305078B22E4825CE9DD55CE15082DF5E2590F2BB2B411D55EE8BB06C8AD7FAE0F5D4C6B9B5DD9
X-7FA49CB5: 0D63561A33F958A5ADA26C4852CA4EA05002B1117B3ED69685B9343340675D321BC0F5E4D9A341CB02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZB2GlZt7kKaQtxikWRYSTag==
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

On 07/06/2026 00:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing bounds check in `insert_entry_into_table_sorted` allows array out-of-bounds write.
> --
> 
> commit 803110810943a93ffdbd8a40adba9348d5b58b1b
> Author: Danila Chernetsov <listdansp@mail.ru>
> 
> drm/amd/display: Validate max_fclk_mhz in DML2 policy builder
> 
> This commit adds a validation check for max_fclk_mhz to prevent an integer
> underflow and out-of-bounds array access when all FCLK entries are zero.
> 
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_policy.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_policy.c
>> index ab2964811c5bc..938faa6272c2c 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_policy.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_policy.c
>> @@ -157,7 +157,8 @@ int dml2_policy_build_synthetic_soc_states(struct dml2_policy_build_synthetic_so
>>   			num_uclk_dpms++;
>>   	}
>>   
>> -	if (!max_dcfclk_mhz || !max_dispclk_mhz || !max_dppclk_mhz || !max_phyclk_mhz || !max_dtbclk_mhz)
>> +	if (!max_dcfclk_mhz || !max_dispclk_mhz || !max_dppclk_mhz || !max_phyclk_mhz ||
>> +		!max_dtbclk_mhz || !max_fclk_mhz)
>>   		return -1;
>>   
>>   	p->out_states->num_states = 0;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but can the subsequent state
> insertions overflow the out_states array?
> 
> Looking at dml2_policy_build_synthetic_soc_states(), it calls
> insert_entry_into_table_sorted() multiple times:
> 
>      // Insert all the DCFCLK STAs first
>      for (i = 0; i < p->num_dcfclk_stas; i++) {
>          ...
>          insert_entry_into_table_sorted(p->in_bbox, p->out_states, &s->entry);
>      }
> 
>      // Insert the UCLK DPMS
>      for (i = 0; i < num_uclk_dpms; i++) {
>          ...
>          insert_entry_into_table_sorted(p->in_bbox, p->out_states, &s->entry);
>      }
> 
>      // Insert FCLK DPMs (if present)
>      if (num_fclk_dpms > 2) {
>          for (i = 0; i < num_fclk_dpms; i++) {
>              ...
>              insert_entry_into_table_sorted(p->in_bbox, p->out_states, &s->entry);
>          }
>      }
> 
> If num_uclk_dpms and num_fclk_dpms can each be derived from the 30-element
> input array, the combined insertions could exceed __DML_MAX_STATE_ARRAY_SIZE__.
> 
> Inside insert_entry_into_table_sorted(), elements are shifted without a bounds
> check:
> 
>      for (i = table->num_states; i > index; i--) {
>          table->state_array[i] = table->state_array[i - 1];
>      }
>      ...
>      table->num_states++;
> 
> Could this write past the end of table->state_array if the total number of
> inserted states across these loops exceeds 30?
> 

Thanks for the review. Both reported issues are pre-existing in the codebase and are completely unrelated to my changes. 
This patch does not introduce, touch, or modify this logic. I request the maintainers to review my patch as is.

Best regards,
Danila Chernetsov
