Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3F49CF35
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818894; cv=none; b=tkdNFkUy2uT5qeBwJGUZJLTknYZMUdGNF1B+nVHks1YOeThh2Bhpn+G4FxKs6dQAiLubm7rbECjx+Pq0IVrM2+6m8oYss16QzLBfkHGtQY+rfMqRL4DYzQ5emLhHPvhJ1woUJ/xWaH8sbgwU4PS0lh5q1ZTtK1j0qxnErwx1Pac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818894; c=relaxed/simple;
	bh=6Qb8rQrdf+c29Iz3Px9LKe1xqRQEBT5SSMwYNpF0zMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMYlyFKxjyNGJ3HR9Ba6+uBg1zihQNjBAUhxH6i2WilFOJt6AsXyLUnusMAua+HNkwgQaMKLOaoCLse4kZAmjjzhz6uam7jfdlsOR0gajmwLWb3H3Gac8xRjDJHoqc/G8oAlQVslHmgSyjgHTun7j5mBfxX+Q+RS8TAXLL0hbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=qmXRGNfy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="qmXRGNfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1791818883;
	bh=cckqM1MgONxFlxUi1g5V6bonrsMA8X+llaxAqLIhnjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmXRGNfySfL4NaLCxUUW0/bubXtRqFShac46prY92pN0d2jmDjYLAK+ifPhSMm1kn
	 9oV/NvONMCK/fHkoER7URnJhjQcIP/Ho9NmP1595CZZ0uvEGfTK+z2l8zduf/OcN42
	 QTXZCtQXMO3aoh+EcCCj/gWfbWG9yNWcwWDZg2w2hR2tJMQCcUIu8jWOcYyNrNXxa5
	 g/A8WeIHA/IKn90kbKb2JtHrx4GJ21Je6hKFqrTQm6EHaoH3Frp5E7DM7jIiJNkeFI
	 e6UluJsq/8Wx6s/oGT2W0L+U76y/k4ec7GGjhmXvyFa03ByKiRxMl8/oEQICBS351P
	 stfXCJrh9D+oQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4j3LvP3WMTz4wG8;
	Tue, 13 Oct 2026 02:28:01 +1100 (AEDT)
Message-ID: <749905e4-52ea-490b-98c7-3923655a52ba@ozlabs.org>
Date: Mon, 12 Oct 2026 16:27:50 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dma-buf: Annul dmabuf->file on file release
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: media-ci@linuxtv.org, dri-devel@lists.freedesktop.org,
 sashiko-reviews@lists.linux.dev
References: <20261009123601.94079-1-matt@ozlabs.org>
 <20261009123601.94079-3-matt@ozlabs.org> <sashiko-outbox-165603@kernel.org>
Content-Language: en-GB
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <sashiko-outbox-165603@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christian, Alex,

I'd be very grateful for your help on this:

On 09/10/2026 14:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dma-buf: NULL pointer dereference of dmabuf->file in exporter drivers
> --
> 
> commit b5be810d5fa3244638a9bad8503cacb8ca86027e
> Author: Matt Evans <matt@ozlabs.org>
> 
> dma-buf: Annul dmabuf->file on file release
> 
> This patch sets dmabuf->file to NULL in dma_buf_file_release() to prevent a
> use-after-free window if the dentry outlives the file. By clearing the
> pointer, exporters using get_file_active() can safely observe that the file
> is closed.
> 
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 36cdc342627ee..d0f8b766e8fd1 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -193,11 +193,26 @@ static void dma_buf_release(struct dentry *dentry)
>>   
>>   static int dma_buf_file_release(struct inode *inode, struct file *file)
>>   {
>> -	if (!is_dma_buf_file(file))
>> -		return -EINVAL;
>> +	struct dma_buf *dmabuf = file->private_data;
>> +
>> +	if (!dmabuf)
>> +		return 0;
>>   
>> -	__dma_buf_list_del(file->private_data);
>> +	__dma_buf_list_del(dmabuf);
>>   
>> +	/*
>> +	 * As the file is being closed, dmabuf->file is no longer
>> +	 * valid and NULL replaces an otherwise stale pointer.  If a
>> +	 * reference to the file isn't already held, the file can be
>> +	 * closed at any time, including before dmabuf->ops->release()
>> +	 * happens: dmabuf->file _must not_ be accessed directly.  An
>> +	 * exporter should use get_file_active(&dmabuf->file) which
>> +	 * atomically tests and acquires a reference to the file (or
>> +	 * returns NULL if the file has closed).  The barrier ensures
>> +	 * get_file_active() observes the store before file_free()
>> +	 * frees the memory.
>> +	 */
>> +	smp_store_mb(dmabuf->file, NULL);
> 
> [Severity: High]
> Does setting dmabuf->file to NULL here cause a NULL pointer dereference in
> exporter drivers that still hold a reference to the dma_buf?
> 
> For example, if a GEM object is exported to a DMA-BUF and the file descriptor
> is closed, the dma_buf is kept alive by the GEM object. If a user then reads
> the debugfs file, amdgpu_bo_print_info() in
> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c dereferences dmabuf->file:
> 
> 		seq_printf(m, " imported from ino:%llu", file_inode(dma_buf->file)->i_ino);
> 	else if (dma_buf)
> 		seq_printf(m, " exported as ino:%llu", file_inode(dma_buf->file)->i_ino);
> 
> Similarly, during cleanup, amdgpu_ualink_cleanup_imp_xa_node() in
> drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c attempts to read the file count:
> 
> 	dev_dbg(adev->dev,
> 		"IMP-CLEANUP: dmabuf free for NPA:%llx handle:%llx:%llx, fc:%lu\n",
> 		imp_xa_node->npa_addr, imp_xa_node->handle.handle_hi,
> 		imp_xa_node->handle.handle_lo,
> 		file_count(imp_xa_node->dmabuf->file));
> 
> Could these routines trigger a kernel panic when dmabuf->file is NULL?

I am out on a limb here, being the first time I've read this driver. :-I 
  It _looks_ like there's a live dmabuf->file because a 
get_dma_buf()-style reference is held here (so a false positive from 
Sashiko).  But I'm quite uncertain.

Christian, that you hadn't already mentioned this hints to me that this 
is safe, is that fair?


Thanks,


Matt
