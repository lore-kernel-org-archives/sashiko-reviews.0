Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7028379C5B;
	Fri, 22 May 2026 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434887; cv=none; b=nb5+SJCs1k/mK8VaM7nhoV3penWIk3ypIZ9fT3I+j0f/0ecEIk2Hf7goaBmcE4vN+uPXrQi2G8xah2UBTKNbkjef/mScMltvBrT464y3Pz8xlKdsLg8ZnzlbA8KFuTY4rNPx4zyOGjlX1jeNny2BX0jOd8V5+qDHKngecbirQas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434887; c=relaxed/simple;
	bh=+77LvOWDdeSbTPbSZ9lUzDrqyRoZjp55R3iOoQkJv8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCXLnpJ7HbniyRjgkr465YPZfM1D5LzYubD3nJ4N3ZjfNMhJDdStonX2HOOYKpAoxBOs4hSPWp3x5kieUceKwtPn2bP4Zvocwbi9pnEH+K6dsksGJg+hdkXa1OD870jmbeFbM1hkcCP1+XPW0FZqkstzNNLCSrryQWePKrtDEd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGNZls72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGNZls72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B3E1F000E9;
	Fri, 22 May 2026 07:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779434886;
	bh=av9yNE3ImDMAQMh1tsV8AmERb3Shty+qungZiC7M8c0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NGNZls72AzBoFeDGpvmNlsuGDt8s6LGjRQdtcXjhBBbbJT0247j9hmoPQb/TcYbAF
	 6mJfBQ6H2oVgemoXzk/Bek5+6tnokpCstZ8YTekHZgX3KejL3QjV75kzql1sBIIevE
	 /o/Yn9sOy8w3J9K+g8wuzl313fG0wJKGcSBqUIsWjlJlX6alATva4VeL82aJoz7JrT
	 frm+LJpzwGU4t2uCdaCH1qs9/JDe1QwU4EDcmPTlIFgJmTUad9x53LF2FZP3Nl4kUA
	 s7/g5JOBBgmPVlD7dOvKfETE97c5NQ3YSoZHHqhuZFHMu5quyG9EblAp2ERJ75VO5m
	 11CqPhodUD+8Q==
Date: Fri, 22 May 2026 12:58:01 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 12/16] media: qcom: Pass proper PAS ID to
 set_remote_state API
Message-ID: <ahAFgc7WpadmRdOW@sumit-xelite>
References: <20260518072856.22790-13-sumit.garg@kernel.org>
 <20260519073408.19739C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519073408.19739C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 07:34:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Missing cancellation of the `sys_error_handler` delayed work in `iris_remove` leads to Use-After-Free and locking a destroyed mutex.
> - [High] Missing memory barrier (`smp_load_acquire` or `READ_ONCE`) when reading `ops_ptr` in PAS API wrappers creates a TOCTOU race and potential NULL pointer dereference or uninitialized memory access.
> --
> 
> commit dc3a6dd9cf1f9278b9e5d984b574b26cf894a4e9
> Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> media: qcom: Pass proper PAS ID to set_remote_state API
> 
> This commit modifies the set_hw_state functions for both iris and venus
> drivers to pass a specific PAS ID instead of 0 to qcom_pas_set_remote_state.
> This change allows the OP-TEE backend to utilize the PAS ID for proper
> bookkeeping.
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index b3c5281aea919..856fa6a79064c 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -109,5 +109,5 @@ int iris_fw_unload(struct iris_core *core)
> >  
> >  int iris_set_hw_state(struct iris_core *core, bool resume)
> >  {
> > -	return qcom_pas_set_remote_state(resume, 0);
> > +	return qcom_pas_set_remote_state(resume, core->iris_platform_data->pas_id);
> 
> This isn't a bug in this commit, but since we are modifying the state
> management for iris_core, there is a pre-existing issue with the
> sys_error_handler delayed work.
> 
> Looking at iris_remove(), we explicitly destroy the core->lock and allow
> the core memory to be freed via devres:
> 
> drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
> 	...
> 	mutex_destroy(&core->lock);
> }
> 
> Could the delayed work execute after the module is unloaded or the device
> unbinds? If so, would iris_sys_error_handler() attempt to acquire the
> destroyed core->lock and access the freed core memory?
> 
> Should we add cancel_delayed_work_sync(&core->sys_error_handler) before
> destroying the lock?

Not in scope of the current patch-set.

> 
> 
> This isn't a bug in this commit either, but since this function calls
> qcom_pas_set_remote_state(), I noticed a potential race condition in how
> the global ops_ptr is read in the API wrapper.
> 
> Looking at qcom_pas_set_remote_state(), it performs lockless plain reads:
> 
> drivers/firmware/qcom/qcom_pas.c:qcom_pas_set_remote_state() {
> 	if (!ops_ptr)
> 		return -ENODEV;
> 
> 	return ops_ptr->set_remote_state(ops_ptr->dev, state, pas_id);
> }
> 
> Because ops_ptr is read without READ_ONCE() or smp_load_acquire(), could
> the compiler reload the pointer?
> 
> If qcom_pas_ops_unregister() clears ops_ptr concurrently, could the second
> read evaluate to NULL, causing a NULL pointer dereference? Furthermore,
> without a barrier, could the CPU reorder reads and observe uninitialized
> contents of the qcom_pas_ops structure?

The PAS backend isn't expected to unregister during the boot power
cycle.

-Sumit

> 
> >  }
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518072856.22790-1-sumit.garg@kernel.org?part=12
