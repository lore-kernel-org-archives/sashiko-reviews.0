Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47BA38C2D0
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 02:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600179; cv=none; b=ceTnE8KQ6Hr0cxCTomsEDrAmssZk7BMkNMdfm/s5F2xmHBYFhvX47gyjVzH8DsHIB/ROdwulGlAVKCcYSGkpEEQ7XHOFAzax5INmzhN3wNnHE4panaN+eAVx/94kmuY2VSJDt14gY5ypu1jid4zpkLYypuTH6ZH9XaI2zgL/q2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600179; c=relaxed/simple;
	bh=Ch0n/JvPymq9g6NIRcfk50se5ognTb00VdbD5qEOEGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2ZBeO5eLBoavw0GdFyb2GK45MZDBprtHfaqVEFlJatitgAioqjmsg2eApTk8FUlA8BJE+5lvbYBa+bOyg0jYOcxMEOSv0h9kKmBU+ztk7Q33iAFuTxtuqdJY5GaduP5JgYr1+D8ii6YS1XZ9sToeF+oFmWnhpOmTskhsvFWyi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=hBZJsTWq; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="hBZJsTWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=8A778y+EHCDdvBAGvePyfYbo2je/GcH8SNuJ7ZUUv1s=;
	b=hBZJsTWqt7kh+8xL19ERcebtfKTlu3kU9JXXU/NamoxeuAcLUZXmVXzApPF72G
	tw2SV6yB2oY0pUVzBW2qLDlNfoqyRsmNOhriGSRQMb6mV8I79eyWVhCirDGKDr2F
	MFCIbXkkrpmL0Cz8FspmH79g7riEO/Q/l++n4tvfXk/JQ=
Message-ID: <c4f9c654-614a-44c9-b96a-31883df45e4b@126.com>
Date: Sat, 10 Oct 2026 10:42:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net v3 2/3] ice: detach the VF representor when
 ice_start_vfs() fails
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org
References: <20261008125754.3520773-1-xiaolinkui@126.com>
 <20261008125754.3520773-3-xiaolinkui@126.com>
 <sashiko-outbox-165587@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <sashiko-outbox-165587@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD337UppslqfFM7BA--.16219S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JrWUuryDtr43JF1rCF4rXwb_yoW7WrW3pF
	WvgFyUKryUXa409w4kuw409ry8u3y8KFyUGrn7KF4Fka15Cr10qr12kay7Xw10k3s7Cwn0
	vr4q9wn7uw4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRGhFsUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlQvAl2rJpitH6gAA3K


On 2026/10/9 21:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ice: ABBA deadlock between pf->vfs.table_lock, devl_lock, and rtnl_lock
> --
> 
> commit e31928012cb273c164e36248e1b33c296e805e8d
> Author: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> ice: detach the VF representor when ice_start_vfs() fails
> 
> This commit modifies the error teardown path of ice_start_vfs() to explicitly
> detach the VF representor. This prevents memory leaks, use-after-free
> scenarios, and stale configuration states.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
>> index bf6410c0d85d4..13d97dbd517c8 100644
>> --- a/drivers/net/ethernet/intel/ice/ice_sriov.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_sriov.c
> [ ... ]
>> @@ -520,8 +520,27 @@ static int ice_start_vfs(struct ice_pf *pf)
> [ ... ]
>> +		/* Mark the VF disabled before its representor and its VSI go
>> +		 * away, the way ice_free_vfs() does, and take cfg_lock
>> +		 * around it to wait out an ice_reset_vf() already in
>> +		 * progress. pf->state has no ICE_VF_DIS on this path and the
>> +		 * loop leaves ICE_VF_STATE_INIT set, so without the bit a
>> +		 * concurrent ice_reset_vf() would pass ice_is_vf_disabled()
>> +		 * and reach ice_eswitch_update_repr() on a destroyed
>> +		 * representor, or trip WARN_ON(!vsi) in ice_dis_vf_mappings().
>> +		 */
>> +		mutex_lock(&vf->cfg_lock);
>> +		set_bit(ICE_VF_STATE_DIS, vf->vf_states);
>> +		mutex_unlock(&vf->cfg_lock);
>> +
>> +		/* detach outside of cfg_lock, see ice_free_vfs() */
>> +		ice_eswitch_detach_vf(pf, vf);
> 
> [Severity: High]
> Does this introduce an ABBA deadlock involving pf->vfs.table_lock, devl_lock,
> and rtnl_lock?
> 
> ice_start_vfs() runs with pf->vfs.table_lock held. Adding a call to
> ice_eswitch_detach_vf() here establishes a lock acquisition order of:
> 
> table_lock -> devl_lock (acquired in ice_eswitch_detach_vf) -> rtnl_lock
> (acquired via unregister_netdev in ice_repr_rem_vf).
> 
> However, there is an opposing lock acquisition order during TC mqprio
> configuration:
> 
> rtnl_lock (held during ndo_setup_tc) -> devl_lock (acquired in
> ice_tear_down_devlink_rate_tree) -> table_lock (acquired right after
> devl_lock in ice_tear_down_devlink_rate_tree).
> 
> If a user enables SR-IOV, triggering an error in ice_start_vfs(), while
> concurrently configuring TC mqprio, could this opposing lock acquisition
> order result in a deadlock?
> 
>> +
>> +		mutex_lock(&vf->cfg_lock);
>>   		ice_dis_vf_mappings(vf);
>>   		ice_vf_vsi_release(vf);
>> +		mutex_unlock(&vf->cfg_lock);
>> +
>>   		it_cnt--;
>>   	}
>>
> 
Thanks for the review.

I agree that the three lock orders do not converge, but I do not think
this patch introduces the inversion, and the cycle is reachable without
it.

ice_start_vfs() already runs under pf->vfs.table_lock and already takes
devl_lock with that lock held, before any failure can happen. Its
forward loop does

	if (ice_is_eswitch_mode_switchdev(pf)) {
		retval = ice_eswitch_attach_vf(pf, vf);
		...
	}

and ice_eswitch_attach_vf() takes devl_lock() around
ice_eswitch_attach(). The teardown loop unwinds only the VFs whose
attach succeeded -- it walks the VFs in the same order and stops once
it_cnt reaches 0 -- so whenever the ice_eswitch_detach_vf() added here
can reach devl_lock(), an ice_eswitch_attach_vf() has already taken it
earlier in the same call, under the same table_lock. In legacy mode
there are no representors to begin with: ice_eswitch_detach_vf()
returns at its xa_load() before reaching devl_lock(), and nothing
attached either. Either way, table_lock -> devl_lock is not a new pair
here.

The full table_lock -> devl_lock -> rtnl_lock chain is pre-existing
too. The other two callers of the same helper hold table_lock and reach
RTNL through it:

	ice_free_vfs()        table_lock -> ice_eswitch_detach_vf()
	ice_reset_all_vfs()                  -> devl_lock()
	                                     -> repr->ops.rem()
	                                     -> ice_repr_rem_vf()
	                                     -> unregister_netdev()

That is in the baseline, not added by the series, and the opposite
order, rtnl_lock -> devl_lock -> table_lock in
ice_tear_down_devlink_rate_tree() reached from ndo_setup_tc, is equally
untouched. So "echo 0 > sriov_numvfs" racing a TC mqprio configuration
can reach both halves today. This is the same pair that was raised in
the v1 review, and the conclusion has not changed.

That said, the two orders do not converge, and converging them is worth
doing. It means taking devl_lock outside pf->vfs.table_lock in
ice_ena_vfs(), ice_free_vfs() and ice_reset_all_vfs(), plus variants of
ice_eswitch_attach_vf() and ice_eswitch_detach_vf() that expect
devl_lock() to be held, since devl_lock() is a plain mutex and the
helpers take it internally. That is a lock hierarchy change across
three callers and the eswitch API, and it is unrelated to the
cfg_lock -> RTNL inversion this series is about, so I would rather send
it as a separate series than carry it in an iwl-net fix that has to be
backported to stable.

No code change in this series for this report.

Thanks,
Linkui

