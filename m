Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9622F3C07
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181270; cv=none; b=NSlLSEgPZBP6l4G7jeLZO8rmdY0DFc9iisbB8b2rMVkKg1QE691qAMGsucwSgPnp6MHvVulQQ2YpwIXGcS85fsSRlI70pPyQLkrh+OpmuhMtnpf6Q4Zxj2Zk3URnhM8xzvDEOm1bJcfCGLxILkPRXe7OHN2N9KQkbPJgZL4A0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181270; c=relaxed/simple;
	bh=lmELAjPNU5BB6haXlmWjM/xqcLlRME3nIN8QwH36o7U=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QumcjOGhKhHKcJRen7osiCl5znofxyawxZThlavMXE9AaIj8uKWeDm1U43wQbvpuhzH6AuPaPTGzwGUPwtXCsNCGydYewpNr13U2mpVFfkDXgtFnWDZY5z91iGOydqrXuwo9+At303Psp/nWNUjuLItqr6tMjV+zU/Uq8R5HJO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xZaR/Yv7; arc=none smtp.client-ip=95.215.58.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xZaR/Yv7"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=lmELAjPNU5BB6haXlmWjM/xqcLlRME3nIN8QwH36o7U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788181263; v=1; x=1788786063;
 b=xZaR/Yv7xZ7nJYgifgHu24DogYG9L4Sg4iIrdAr4aoLlyUGHP1cEoyajVyfMO+y1Wh5/gg1O
 Sbh5i72n9lNg9RqLyrBEBDHUFZZvSWyaS6h/ghbwDDDjkl5pwNURd9/eqlyJcuCtsvtfZ84al1g
 Gdria0gDBRhV+cKuV3G5Shtk=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id fff74117a86ebb1b;
	Mon, 31 Aug 2026 13:00:59 +0000
X-Mizu-Trace-ID: fff74117a86ebb1b
X-Migadu-Flow: FLOW_OUT
Message-ID: <739848e0-1d35-4ed7-afd7-4b0609ddb8d0@linux.dev>
Date: Mon, 31 Aug 2026 21:00:52 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, mptcp@lists.linux.dev
Subject: Re: [PATCH mptcp-next 2/2] mptcp: pm: skip extra_subflows accounting
 on disconnected msk
To: sashiko-reviews@lists.linux.dev
References: <20260831093206.689827-1-cui.tao@linux.dev>
 <20260831093206.689827-3-cui.tao@linux.dev>
 <20260831101129.203081F000E9@smtp.kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260831101129.203081F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the review. 

在 2026/8/31 18:11, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Subflows in `join_list` can be leaked due to unsynchronized zeroing of `cb_flags` in `mptcp_disconnect`.
> - [High] Data race on `pm->reset` and `pm->rm_list_*` fields due to missing `pm->lock` in `mptcp_pm_data_reset()`.

Both findings are pre-existing issues rather
than regressions from this series, but I had a look at them:

For the join_list leak, I agree it is real. When an MP_JOIN is
processed while the parent socket is being disconnected, the subflow
is queued in msk->join_list and MPTCP_FLUSH_JOIN_LIST is set under
the data lock, but mptcp_disconnect() then clears msk->cb_flags with
a plain write. The flag is lost, mptcp_release_cb() never flushes
the list, and since mptcp_destroy_common() only iterates conn_list,
those subflow sockets are leaked. The plain write also drops flags
that were already pending before the disconnect, so taking the data
lock around it is not enough. What I have in mind is to keep the
flush-related bits across the disconnect and let release_sock()
process the join list as originally intended, or to drain it
explicitly in the disconnect path, checking the lock nesting
commented in mptcp_destroy_common().

For the pm->reset data race, the lasting effect is the counter
imbalance this series now clamps and traces, and the other fields
are discarded on a closed socket anyway. The direct fix is to take
pm->lock around the reset in mptcp_pm_data_reset(), after checking
the lock ordering on all callers.

These are two separate bugs with separate Fixes: targets, so I plan
to submit them as their own series rather than folding them into
this one.

Tao

> --
> 
> commit 179deded54d27540d6b26de1228c24065e1fa9d4
> Author: Tao Cui <cuitao@kylinos.cn>
> 
> mptcp: pm: skip extra_subflows accounting on disconnected msk
> 
> This commit addresses a WARN_ON_ONCE crash related to extra_subflows
> underflow by skipping the PM accounting when the mptcp socket is in the
> TCP_CLOSE state. It replaces the warnings with rate-limited prints and
> avoids modifying the counters for disconnected sockets.
> 
> Link: https://github.com/multipath-tcp/mptcp_net-next/issues/629
> 
>> diff --git a/net/mptcp/pm.c b/net/mptcp/pm.c
>> index b10895606542a..60276eb1ef384 100644
>> --- a/net/mptcp/pm.c
>> +++ b/net/mptcp/pm.c
>> @@ -676,9 +676,18 @@ void mptcp_pm_subflow_check_next(struct mptcp_sock *msk,
>>  	update_subflows = subflow->request_join || subflow->mp_join;
>>  	if (mptcp_pm_is_userspace(msk)) {
>>  		if (update_subflows) {
>> +			/* The PM counters have already been cleared if the
>> +			 * msk got disconnected while this subflow was still
>> +			 * queued in the join list
>> +			 */
>> +			if (inet_sk_state_load(sk) == TCP_CLOSE)
>> +				return;
> 
> [Severity: High]
> This is a pre-existing issue, but does mptcp_disconnect() leak subflows when
> zeroing cb_flags non-atomically?
> 
> If a concurrent mptcp_finish_join() receives an MP_JOIN ACK for a subflow
> while the parent socket is being disconnected, it can hit the
> sock_owned_by_user(parent) branch. The subflow is added to msk->join_list
> and MPTCP_FLUSH_JOIN_LIST is set in msk->cb_flags while holding the parent's
> data lock.
> 
> Simultaneously, mptcp_disconnect() executes msk->cb_flags = 0 without holding
> the mptcp_data_lock, erasing the MPTCP_FLUSH_JOIN_LIST flag:
> 
> net/mptcp/protocol.c:mptcp_disconnect() {
> 	...
> 	msk->cb_flags = 0;
> 	...
> }
> 
> When the lock is released, release_sock() invokes mptcp_release_cb(), but
> since the flag was erased, it skips the flush:
> 
> net/mptcp/protocol.c:mptcp_release_cb() {
> 	...
> 	if (flags & BIT(MPTCP_FLUSH_JOIN_LIST))
> 		__mptcp_flush_join_list(sk, &join_list);
> 	...
> }
> 
> Can this lead to the sockets in join_list being completely leaked when
> mptcp_destroy_common() later iterates only over conn_list?
> 
> [Severity: High]
> This is a pre-existing issue, but is there a data race on pm->reset and
> pm->rm_list_* fields when mptcp_pm_data_reset() is called during disconnect?
> 
> When mptcp_disconnect() sets sk->sk_state to TCP_CLOSE, it calls
> mptcp_pm_data_reset(msk), which modifies PM structures without acquiring
> pm->lock:
> 
> net/mptcp/pm.c:mptcp_pm_data_reset() {
> 	...
> 	memset(&pm->reset, 0, sizeof(pm->reset));
> 	pm->rm_list_tx.nr = 0;
> 	pm->rm_list_rx.nr = 0;
> 	...
> }
> 
> At the same time, subflow receive paths can process incoming MP_JOIN or
> RM_ADDR packets in BH context, holding only pm->lock and lock_sock(ssk) rather
> than lock_sock(msk). For example:
> 
> net/mptcp/pm.c:mptcp_pm_allow_new_subflow() {
> 	...
> 	spin_lock_bh(&pm->lock);
> 	if (READ_ONCE(pm->accept_subflow)) {
> 		ret = pm->extra_subflows < limit_extra_subflows;
> 	...
> }
> 
> Could this unprotected memset in mptcp_pm_data_reset() cause torn writes and
> corrupted PM state when racing with readers and writers that only hold
> pm->lock?
> 
> [ ... ]
> 

