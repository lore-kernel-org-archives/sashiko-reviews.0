Received: from send101.i.mail.ru (send101.i.mail.ru [89.221.237.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D822F1E47C5
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 02:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780192863; cv=none; b=EDfCugc3EwfV1kxP+vLLlLoOeOuea84e8Y8VMkd2b4fs8MWQkfPiBRiWxHsSKnpVsi9YhG6c9F1Y1NS8YuElj3xTpVxz09Bh5Iy4GIwg+harRNzI4FFvnDd8chXN++hrDkY9Ed2VdwqPGqRSXBb4aw03xP/S3bRqfc1GtWcCMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780192863; c=relaxed/simple;
	bh=nqgWyjTLBwN4kjsInNXFp5OtWmtZk4xTnIfTM7sd8Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHFmxS43GWYSd13YNdByAtr3Bh9kkuuacehx5TUjIATsD4yizegeYi7dAJw89VZJyAGHETnXyMrIRwOpH6KmLsciWpWdnxPc6qX3bopUPqbZsTtGmeb1BrLyeEqKyZy8K7tMw9f2nMiuCEYtbvgYImhZyR6uwXOOvRsbHeLuhCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=VVT/v/kb; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=XMekRzKk; arc=none smtp.client-ip=89.221.237.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="VVT/v/kb";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="XMekRzKk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=EA8sS6QiWIwhomepHlvAu/OA/C47HreEKS1a1Op8kU0=; t=1780192859; x=1780282859; 
	b=VVT/v/kbX53DhzPA+RJfEZ1lcIYYTnL2vx6fPNXMCjs5lxB/6qAnjBh/KFMGNof2VRW1MCjGiqC
	6W8/q3HBb3AEBySBw0qaMq/UHNXuHD8ELdPNl+M/tBWwu+tYRXfvKfvRWDUUCk/1OukAuYU7zveGE
	HQqsPOv7TCz6a7ieE7mCQPtWEZNzKzdoDs2D1vrmrT8ygkdOC1QpOQt8T9mnRCJTwHZ4trzwN4ap0
	M8597L0Pk2SmnSsEn4RvuE6MiityLLedZmImqsPzYtp3SO+GjhwBshCdR43sRaLrB3SWPN12AUmqG
	ZSHG66lZhYFpF3QfUlVh+zMMfsM2FcrCdc5w==;
Received: from [10.113.53.15] (port=34728 helo=send81.i.mail.ru)
	by exim-fallback-554f498d9f-6bm5t with esmtp (envelope-from <listdansp@mail.ru>)
	id 1wTVFN-00000000Buh-2ob1
	for sashiko-reviews@lists.linux.dev; Sun, 31 May 2026 04:45:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	Disposition-Notification-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids:
	Disposition-Notification-To; bh=EA8sS6QiWIwhomepHlvAu/OA/C47HreEKS1a1Op8kU0=;
	t=1780191949; x=1780281949; b=XMekRzKkL3t66ti20rQB8JROQYTSwt5cuHfEA0XkOV0EZp1
	0yl7kprTTxv5Yg3E9mI8YtJEfgd1fvi5ovtq653qGLu0+FYpR3yzRgv4P042hQQIel6OkMsyPYbDo
	+bV++ZeI+2bpzjdMlPIU3b4pZFnL4raXUWNaeK/pj+jJMo21uJk3J7UnxYcDxhaNMO8rn1TFuHAgm
	iVjTvI7Y9sL666dYhmkvrT622KMaWbRU31y5e2igynWvjcb8eS0EHG97+Ghy/EuVcSDWA311FYNxD
	ln5TpDdjptXU6UntH+wwS1KLYeMwgYay7c0aJNkbnlYfilFNOR+bjkbBf1Zytl1g==;
Received: by exim-smtp-5b85998476-qs2jf with esmtpa (envelope-from <listdansp@mail.ru>)
	id 1wTVFE-000000009Xg-3m4f; Sun, 31 May 2026 04:45:41 +0300
Message-ID: <69fdd3cf-3235-40fb-98a2-9d465d11b6ec@mail.ru>
Date: Sun, 31 May 2026 04:45:39 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ext2: fix ignored return value of generic_write_sync()
To: sashiko-reviews@lists.linux.dev
Cc: tytso@mit.edu
References: <20260530122311.136803-1-listdansp@mail.ru>
 <20260530125616.E4FA71F00893@smtp.kernel.org>
From: listdansp <listdansp@mail.ru>
Content-Language: en-US
In-Reply-To: <20260530125616.E4FA71F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9402BF17F4A9A44D6C0F45F53FA16C4A3AEF0C80873149E5300894C459B0CD1B910F355D4D99051725D1BE6A8D71B10A5EB45CE5A73E4071A736AA9B58FF3E5D9750FC9643A608EC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7956F10FFCC7409BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566A66E13412CE89A701B2F22CC1A8872D141E37BC14E25A9DC2070FDB36ADA46958EEF46B7454FC60B9742502CCDD46D0D4B3849D6E5CCBAFD117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC587F3D2152687E5CA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352026055571C92BF10FBDFBBEFFF4125B51D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE1E561CDFBCA1751FE45489B29CB19804D8FC6C240DEA76429C9F4D5AE37F343AA9539A8B242431040A6AB1C7CE11FEE386A7C529F68B8E5C03F1AB874ED89028C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637C2DF74EEBC06819EEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A508D9D21C25D2443A5002B1117B3ED6968698CAE6442AD6533D2BBC1EF78EDEBE823CB91A9FED034534781492E4B8EEAD5DF1C2DF01CE7211BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE1918E10F71CB4DF9F9677DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6592EE7C62AE04F19A36D0A361A63BB1E151170468342817C0E96E5165F47317F784B90D2D1F7361A39B8341EE9D5BE9A0A6CD88F51EF5A2947D71821397ACEEBBFF361CC0150DA42E68CD93680B12512CF4C41F94D744909CE04437D853D7CD20871FE3B1D98EC473624A389F0E278DBF4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVRI2994ruhLU24cxkMkOSqM=
X-Mailru-Sender: 4CE1109FD677D277A25EA9D9B320DF53736E4F01AA0BCF49B951B70A5BD4BD8E2A74B75EC757E37C933BB49804EACBAAC53BD13D3F6EEB2F3DDE9B364B0DF289C95E31D8FCF52BE1594FB4C9F0DBF4120D4ABDE8C577C2ED
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B487EF4F2ACC83E26BB702F02B268DA6496C859E3200F3DFCF049FFFDB7839CE9E335F9B817DF9F54FEBB6A094B4CDBEAC11DCFC76D673E80D8F374D8A0A4C2F43424AC859ADEBBDCA
X-7FA49CB5: 0D63561A33F958A593BDECD49FD9C7255002B1117B3ED6960F1A77B0A57981A93E359E1F9564EB4B02ED4CEA229C1FA827C277FBC8AE2E8B80EFB95A1EAD2135
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZkILg+JrBnMBoC4MsZPonxQ==
X-Mailru-MI: 20000080020000000000000800
X-Mras: Ok

On 30/05/2026 15:56, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] If the direct I/O phase partially succeeds but the buffered fallback fails, the successful partial write byte count is discarded and an error is returned.
> - [High] For O_DIRECT writes without O_SYNC, I/O errors during the buffered fallback writeback phase are silently ignored, causing the write to report success even if data did not reach the disk.
> --
> 
> commit 219eb44f6ba1253d0149b02cde5191ac13546983
> Author: Danila Chernetsov <listdansp@mail.ru>
> 
> ext2: fix ignored return value of generic_write_sync()
> 
> Fix ext2_dio_write_iter() to propagate the error returned by
> generic_write_sync() instead of silently discarding it, which could
> cause write(2) to return success to userspace on O_SYNC/O_DSYNC files
> even when the sync failed.
> 
>> diff --git a/fs/ext2/file.c b/fs/ext2/file.c
>> index d9b1eb34694a0..855a62e96c380 100644
>> --- a/fs/ext2/file.c
>> +++ b/fs/ext2/file.c
>> @@ -272,7 +272,7 @@ static ssize_t ext2_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but if the direct I/O phase
> partially succeeds while the buffered fallback fails, is the successful
> partial write byte count overwritten?
> 
> In ext2_dio_write_iter(), the error handling for generic_perform_write()
> looks like this:
> 
> 		status = generic_perform_write(iocb, from);
> 		if (unlikely(status < 0)) {
> 			ret = status;
> 			goto out_unlock;
> 		}
> 
> If generic_perform_write() returns a negative error code (such as -ENOSPC)
> because no additional bytes can be written, ret is updated with this error.
> Could this hide the fact that data was successfully written and the file
> offset advanced, violating POSIX write semantics and causing userspace to
> corrupt the file by duplicating data on retry?
> 
> [Severity: High]
> This is a pre-existing issue, but are I/O errors during the buffered
> fallback writeback phase silently ignored for O_DIRECT writes without
> O_SYNC?
> 
> Looking earlier in ext2_dio_write_iter():
> 
> 		ret2 = filemap_write_and_wait_range(inode->i_mapping, pos,
> 						    endbyte);
> 		if (!ret2)
> 			invalidate_mapping_pages(inode->i_mapping,
> 						 pos >> PAGE_SHIFT,
> 						 endbyte >> PAGE_SHIFT);
> 
> If filemap_write_and_wait_range() fails and returns a negative error
> code in ret2, the error only prevents cache invalidation and is never
> propagated to the final return value. Will this cause the write to report
> success to userspace even if the data failed to reach the disk?
> 
>>   						 pos >> PAGE_SHIFT,
>>   						 endbyte >> PAGE_SHIFT);
>>   		if (ret > 0)
>> -			generic_write_sync(iocb, ret);
>> +			ret = generic_write_sync(iocb, ret);
>>   	}
>>   
>>   out_unlock:
> 

Thanks for the review. Both reported issues are pre-existing in the codebase and are completely unrelated to my changes. 
This patch does not introduce, touch, or modify this logic. I request the maintainers to review my patch as is.

Best regards,
Danila Chernetsov
