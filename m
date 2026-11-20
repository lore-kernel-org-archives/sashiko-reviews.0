Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156427;
	b=kAvNYlNqNj315fmJuIZPuXfwevDk7YGO9Igi3aEaRKMJZuAlNuiT3FzCxUfJQOWT97lr
	 hBAe5NkX04THLv7YXLdtbPZxpkYw+jjpOnokc0qOVsGgMxofsZtkrH7jR9JDXwQPgAI3n
	 3E9v5iv+GHhq/YG2Nc3yVOTFdqMVuvBx09LWxFYcgj+ibeUxtX5qRHC2MQ8mk7msFkvvO
	 8hPjPidxi7Z9PThrbwsPcVkIV0d3Tresdxjji4Tu9SYJXXzn3MUVGulprk6SAAsuykS1m
	 mc5Gid/s3SRg/7E0orjV4ZNrALB/IRs+b+pdtGIEliRDSiKSqSF909Fc2g+WTABJ6rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156427;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6+tKDQwEeA1QycLy1q/6pVnwscOUlj0nSYiW6ffKwFs=;
	b=WwLbi+zQ7UU98wBUBcOyop5wM+VtZzZ5PbyhJogNOSpnuXAujgIWtOi8OLnLcqMGR7AA
	 Hh7OGXyPnPlsUCVcvGvm3x0fwz4pyY5PdjjvCdqt1WECHRSgmEOcZtd+vtmOntC8pgLTF
	 XH4DAKDcAO4Tlc1XGoI91IlGbdP5Ahqm7f5fyHyxPYSZ6tV0jYIWqXhMZQ+0GOqSsttca
	 qF1a8GnJla3MYfA8n69LbeS0DAt6s1cfchWrjFDZ81cP3V1lUHbuSoaUOtzOlD1J4W4C2
	 XXMSHbfeTQh4cUmi2Vgu0XtFFmqmn/TD4Z0ncSVJLFyxx7LsqCT5jY3pE+sbijQIDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PxvFMEZ7;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2037E606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 06:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2037E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PxvFMEZ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795156426; x=1826692426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7o13anAi3NWFvjSG88BvaaWCAAmfyZ989OEfaurFiuE=;
  b=PxvFMEZ7UtLOznO5DoROnsTZuBXxiGvwYH2MZlQw93v9jmJxBD4vnWrf
   LoF9zdRMqsrXINgSOyphcAgbpKptoc4fVNkKbQeaICbeYYvgy6UUU00uo
   Dd3yhGx4pRWkSiIQJpRmA6neP/LWLrH5fYE8T7WXjYn7JWp9Lv889XYHp
   19T4yOUeLV2ZH0GKBP9EbAP+j9MWW1DoL3gFKdTlib/PjySEswv94RD9d
   c90ewH+gsvZx9lxa0u6bxDxN9m+4nJHg6nLMDHAoF3EtRkfU3eOm5Dd5n
   +cVgy4py18Xdv3FJiD7iHuQ0VnDKVev/SkAEINEpxO7VZOWgMmepenm9l
   w==;
X-CSE-ConnectionGUID: o2zvLRT2QNaUhm040g20gQ==
X-CSE-MsgGUID: heD9h961RNKEwUvABS8G/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3926294"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3926294"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:33:46 -0800
X-CSE-ConnectionGUID: IRbVOWx4QlKni1SLVTYySg==
X-CSE-MsgGUID: IXdnvrPdTsWvm/LlpOlV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12472126"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 19 Nov 2026 22:33:45 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B751799; Fri, 20 Nov 2026 07:33:43 +0100 (CET)
Date: Fri, 20 Nov 2026 07:33:43 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/18] thunderbolt: Re-apply Alpine/Titan Ridge flow on
 resume
Message-ID: <20261120063343.GF229695@black.igk.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-6-mika.westerberg@linux.intel.com>
 <sashiko-outbox-223706@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-223706@kernel.org>

Hi,

On Thu, Nov 19, 2026 at 05:35:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] thunderbolt: missing tb_pci_post_activate() in
>   tb_runtime_resume()
> --
> 
> commit 087ef2024705f5c81e4d876d241a868e52e4e3b5
> Author: Mika Westerberg (Intel) <westeri@kernel.org>
> 
> thunderbolt: Re-apply Alpine/Titan Ridge flow on resume
> 
> This commit extracts the PCIe L1 enable and xHCI connect steps into
> tb_pci_post_activate() and calls it when re-activating PCIe tunnels in
> tb_resume_noirq().
> 
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 3c4903adb687d..6a11d686bdf14 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -2315,6 +2315,21 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
> >  	return 0;
> >  }
> >  
> > +static void tb_pci_post_activate(struct tb_tunnel *tunnel)
> > +{
> > +	struct tb_switch *sw = tunnel->dst_port->sw;
> > +
> > +	/*
> > +	 * PCIe L1 is needed to enable CL0s for Titan Ridge so enable it
> > +	 * here.
> > +	 */
> > +	if (tb_switch_pcie_l1_enable(sw))
> > +		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
> > +
> > +	if (tb_switch_xhci_connect(sw))
> > +		tb_sw_warn(sw, "failed to connect xHCI\n");
> > +}
> 
> [ ... ]
> 
> > @@ -3239,6 +3246,8 @@ static int tb_resume_noirq(struct tb *tb)
> >  			usb3_delay = 0;
> >  		}
> >  		tb_tunnel_activate(tunnel);
> > +		if (tb_tunnel_is_pci(tunnel))
> > +			tb_pci_post_activate(tunnel);
> >  	}
> 
> [Severity: Medium]
> Should tb_runtime_resume() also call tb_pci_post_activate() when it
> re-activates PCIe tunnels?

No actually. This is only needed for suspend to disk where we reset the
topology (but there is no harm calling it unconditionally in
tb_resume_noirq(()). LC keeps this over RTD3.
