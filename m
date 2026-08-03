Received: from heron.birch.relay.mailchannels.net (heron.birch.relay.mailchannels.net [23.83.209.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA830D3F8
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787862; cv=none; b=f/6mEzPkFezh9JygOl7LiUjRY7xllwWFjj598t3ScerkTGkCRVVN9vyfBsC8FmPZr884620OOMy9uCu8qOJn4QMtrltHZYP1djZF3gVceGvYrSfrx3Gdz9NM4wpN9JQW+l+gD/hKTBQ5mzOtjw06WA+h5t7wgs9CM41Pw9Jshf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787862; c=relaxed/simple;
	bh=io2MAlRr9oG+AJcwI1d6xwdVOseYEH/R/L9RUghY2ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZEe7ub8Ot+UmAnX7ajA0t0okgufuUOtLvgcpVGLLQosb/Mu9u8rtPQK75/W3XSpVGmh8988qoA4RitkZsCwmWAlSegINzjB/eL0+E3kmKUIiwGzhUjC23+eqzAcW9rgqFoB0kbGxVdDCsGGv+g5XwhQDxwv2cgcqDGoD49sH9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=fail smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=bfJmVjFo; arc=none smtp.client-ip=23.83.209.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="bfJmVjFo"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D4C8D4C25F2;
	Mon, 03 Aug 2026 18:55:11 +0000 (UTC)
Received: from pdx1-sub0-mail-a227.dreamhost.com (100-108-70-126.trex-nlb.outbound.svc.cluster.local [100.108.70.126])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id E41064C2830;
	Mon, 03 Aug 2026 18:55:09 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Minister-Trade: 12f34d71196e5865_1785783310513_3543770020
X-MC-Loop-Signature: 1785783310513:4190499230
X-MC-Ingress-Time: 1785783310512
Received: from pdx1-sub0-mail-a227.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.70.126 (trex/8.0.2);
	Mon, 03 Aug 2026 18:55:10 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a227.dreamhost.com (Postfix) with ESMTPSA id 4hDQpj3wbdz1d8;
	Mon,  3 Aug 2026 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1785783309;
	bh=siJi4mmUcnDZF68egfStMVH5FmIUAowG1dNveBmtVt8=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=bfJmVjFotEq9UjeuMttc/5XkiuRCT9s954UF83NY7zn3X3qhxzR/NEtv1cjyNKKaj
	 bbPH+90EiwYsBwnNRBgLpF5b5hTCnIUM+RbHhcvkcQqCM4Lo+Kl9fQ/iZN0YqwrjFX
	 qw+UNfTS2DhURDQXqYBU4DMfs1GmtpdKLCnw1xmcu+JZMAfSxmbMsaSQx0/3tsmx8v
	 0eyKilQK4o1B4rsjvEcgWPUBerBzdOuOCK4cFyZld6RJo6cSB/159Mz6K5mduoueT2
	 YU70r0cy7Lmq6OPEvMuC+wE9sVuKraZ0z7nqe062pyHnJIqfCHlApJSUfOGk2XZKbr
	 Nil+w8sbRQbvg==
Date: Mon, 3 Aug 2026 11:55:06 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: sashiko-reviews@lists.linux.dev, dave.jiang@intel.com
Cc: linux-cxl@vger.kernel.org
Subject: Re: [PATCH v7 2/8] cxl/pci: Add BI topology enable/disable
Message-ID: <20260803185506.wynluncuhpda2tw7@offworld>
References: <20260728144136.709882-1-dave@stgolabs.net>
 <20260728144136.709882-3-dave@stgolabs.net>
 <20260728151629.20F0D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260728151629.20F0D1F000E9@smtp.kernel.org>
User-Agent: NeoMutt/20220429

On Tue, 28 Jul 2026, sashiko-bot@kernel.org wrote:

>Thank you for your contribution! Sashiko AI review found 5 potential issue=
(s) to consider:
>- [High] Topology walk loop exits early, completely skipping CXL Root Port=
s and breaking BI enablement.

No, we already covered this.

>- [High] Missing explicit hardware commit for Endpoints and Root Ports.

No, we already covered this.

>- [High] Premature BI disablement on shared Switch DSPs due to missing `nr=
_bi` reference counting.

No, we already covered this.

>- [Medium] Hardware register state is leaked (left enabled) when a downstr=
eam port fails to commit.

Yes, that's a corner case which I've fixed up but should not be a show stop=
per for v7.
The fix is trivial, see below.

>- [Medium] Writing to the BI_COMMIT control bit without waiting for the BI=
_COMMITTED status bit to clear introduces a race condition.

False positive. This is guaranteed per hw - see Table 8-158.

=2E..

>> +static int cxl_bi_enable_path(struct cxl_dev_state *cxlds,
>> +			      struct cxl_port *port, struct cxl_dport *dport)
>> +{
>> +	struct cxl_dport *dport_iter, *failed;
>> +	struct cxl_port *port_iter;
>> +	int rc;
>> +
>> +	port_iter =3D port;
>> +	dport_iter =3D dport;
>> +	while (!is_cxl_root(port_iter)) {
>> +		rc =3D cxl_bi_ctrl_dport_enable(dport_iter);
>> +		if (rc)
>> +			goto err_rollback;
>> +
>> +		dport_iter =3D port_iter->parent_dport;
>> +		port_iter =3D dport_iter->port;
>> +	}
>
>[Severity: High]
>Does this also skip enabling the Root Port?
>
>Using the same !is_cxl_root() condition as cxl_bi_dealloc(), this loop will
>exit before calling cxl_bi_ctrl_dport_enable() for the Root Port, leaving =
the
>host path incomplete.
>
>[ ... ]
>> +err_rollback:
>> +	failed =3D dport_iter;
>> +	dport_iter =3D dport;
>> +	port_iter =3D port;
>> +	while (!is_cxl_root(port_iter) && dport_iter !=3D failed) {
>> +		cxl_bi_ctrl_dport_disable(dport_iter);
>> +		dport_iter =3D port_iter->parent_dport;
>> +		port_iter =3D dport_iter->port;
>> +	}
>> +	return rc;
>> +}
>
>[Severity: Medium]
>Should the failed dport be included in the rollback loop?

No, we've already covered that. But we can fix the register
rollback:

--- a/drivers/cxl/core/pci.c
+++ b/drivers/cxl/core/pci.c
@@ -1161,12 +1161,11 @@ static int __cxl_bi_ctrl_dport(struct cxl_dport *dp=
ort, bool enable)
		writel(value, bi + CXL_BI_DECODER_CTRL_OFFSET);

		rc =3D __cxl_bi_commit_decoder(dport->dport_dev, bi);
-		if (rc)
-			return rc;
-
-		if (port->regs.bi_rt)
-			return __cxl_bi_commit_rt(&port->dev, port->regs.bi_rt);
-		return 0;
+		if (!rc && port->regs.bi_rt)
+			rc =3D __cxl_bi_commit_rt(&port->dev, port->regs.bi_rt);
+		if (rc && enable) /* undo previous enablement */
+			writel(ctrl, bi + CXL_BI_DECODER_CTRL_OFFSET);
+		return rc;
	default:
		return -EINVAL;
	}


>
>If cxl_bi_ctrl_dport_enable() writes the enable bit but the hardware commit
>fails, the control register has still been modified.
>
>By stopping the rollback when dport_iter !=3D failed,
>cxl_bi_ctrl_dport_disable() is never called for it, potentially leaking the
>hardware register state as left enabled.
>
>--
>Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260728144136.709882=
-1-dave@stgolabs.net?part=3D2
