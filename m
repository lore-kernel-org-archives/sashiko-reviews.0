Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9227543935C
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 07:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716412; cv=none; b=ApqATQ90LLP8whFZBvXctQIMLoJlX4LbXiGb9WPIuxEf9ZuVmTOL26MI6gG5t/OlBePSt2u2gsnATjhr/zHzqqGzJxevDw/r7zTP6cSZ5DRsWvVM7fzRCd25e2gKQTW1Sv16z1PovIWnUhRA0s0wxwIW+lpGBjSkgXacD78YGKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716412; c=relaxed/simple;
	bh=xZP6ftAtGzbZfQ0/YaJyLYZIBoBtWq9fi4M/yZkk3Uk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLzhzx2wI9Ax+VH4UrLcmvjzMdYMSvRXcKlY5+bQNgYVoXkh4AK9xaeK83U81U6PhhJawQ+hK0DND68mlluwLMGe10Imvv3midPba+NBN4x2MnQdxDb9RFEnItal4vNxhNAxbSGL25vJsQr/SDnaslxRto/AM1A1KKDGKuK+fk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R6ojULKy; arc=none smtp.client-ip=91.218.175.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R6ojULKy"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=xZP6ftAtGzbZfQ0/YaJyLYZIBoBtWq9fi4M/yZkk3Uk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789716385; v=1; x=1790321185;
 b=R6ojULKybALVFbU9XTc9+hWzhhRcZofFuvDAiW/7UlM13MZvv9i7NnIjan9MPFOQy0ua3137
 qf4xQldBNBdStJNlHshA9o4qtOrj8x0U84y23OnjRjrYB5Pb7jlqp/TrvnmR+ZqovJsHp5XETSI
 wTa2p6jtv6yWDKedHC+7xSrY=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id c9dde96b7cfbc86a;
	Fri, 18 Sep 2026 07:26:15 +0000
X-Mizu-Trace-ID: c9dde96b7cfbc86a
X-Migadu-Flow: FLOW_OUT
Date: Fri, 18 Sep 2026 15:26:06 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: sashiko-reviews@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 1/6] net: lwtunnel: change encap fill order
Message-ID: <aqznjquXIavzmuFD@fedora>
References: <20260917-ynl_rt_encap-v1-0-fbbe6e680571@kylinos.cn>
 <20260917-ynl_rt_encap-v1-1-fbbe6e680571@kylinos.cn>
 <20260918063655.418681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918063655.418681F000FF@smtp.kernel.org>

Hi Jakub,
On Fri, Sep 18, 2026 at 06:36:54AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] net: lwtunnel: incomplete rollback on fallback path leaves orphan RTA_ENCAP_TYPE
> --
> 
> commit b32da4e3fb34d0c2a7a1afb438a76ca410be21ec
> Author: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> net: lwtunnel: change encap fill order
> 
> This commit changes the order in which lwtunnel netlink attributes are
> emitted. It places the encap_type_attr before the encap_attr nest to
> ensure userspace YNL can decode the sub-messages correctly.
> 
> > diff --git a/net/core/lwtunnel.c b/net/core/lwtunnel.c
> > index b01a395d9a966..f13dfa02e026e 100644
> > --- a/net/core/lwtunnel.c
> > +++ b/net/core/lwtunnel.c
> > @@ -240,6 +240,10 @@ int lwtunnel_fill_encap(struct sk_buff *skb, struct lwtunnel_state *lwtstate,
> >  	    lwtstate->type > LWTUNNEL_ENCAP_MAX)
> >  		return 0;
> >  
> > +	ret = nla_put_u16(skb, encap_type_attr, lwtstate->type);
> > +	if (ret)
> > +		return ret;
> > +
> >  	nest = nla_nest_start_noflag(skb, encap_attr);
> >  	if (!nest)
> >  		return -EMSGSIZE;
> > @@ -254,9 +258,6 @@ int lwtunnel_fill_encap(struct sk_buff *skb, struct lwtunnel_state *lwtstate,
> >  	if (ret)
> >  		goto nla_put_failure;
> 
> [Severity: Medium]
> Does this leave an orphaned attribute in the buffer on the fallback path?
> 
> If ops->fill_encap is unsupported, it evaluates to -EOPNOTSUPP and execution
> jumps to nla_put_failure:
> 
> net/core/lwtunnel.c:lwtunnel_fill_encap() {
> ...
> nla_put_failure:
> 	nla_nest_cancel(skb, nest);
> 
> 	return (ret == -EOPNOTSUPP ? 0 : ret);
> }
> 
> Because nla_put_u16() was moved before nla_nest_start_noflag(),
> nla_nest_cancel() only unwinds the buffer up to the start of the nest.
> This leaves the encap_type_attr orphaned in the skb payload.
> 
> Since the function returns 0 (success) in the -EOPNOTSUPP case, the caller
> is prevented from discarding the message, which results in a malformed
> netlink message being sent to userspace.
> 
> Could we record the skb tail pointer before nla_put_u16() and restore it on
> failure, or is there another preferred way to unwind the encap_type_attr?

I'd like to add a checking

	if (likely(ops && ops->fill_encap)) {
		ret = nla_put_u16(skb, encap_type_attr, lwtstate->type);
		if (ret)
			return ret;
	}

to cover the EOPNOTSUPP issue. For other errors, the netlink fill will abort
directly. What do you think?

Thanks
Hangbin

> 
> >  	nla_nest_end(skb, nest);
> > -	ret = nla_put_u16(skb, encap_type_attr, lwtstate->type);
> > -	if (ret)
> > -		goto nla_put_failure;
> >  
> >  	return 0;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260917-ynl_rt_encap-v1-0-fbbe6e680571@kylinos.cn?part=1
