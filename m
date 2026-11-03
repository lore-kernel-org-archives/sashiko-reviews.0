Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.135.140.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717832;
	b=QK9O17cXDDyfNidKtZNh2MEg+P3DlUGvjmaOLQ80G79Hggma4EbFOICnrdVQi1K8GDSD
	 nigZ6bH2T/L3YOuVHpIrWSG5+kqG8R7MLNCyWjt+c1566cnLzHan1Di0eSIgTxV1oZa+n
	 nfbpf1WRspWEkithio7XoajTzgzCy7yw5iFG70vIX+rn636IHZJZ3RnBoX4+dsJqVu5Md
	 PH95DlHBVi6/BDSGVSfBWhNs8Wv5dfQ42UphDJYJp9Qx/uM5WIEvLZ0ssnSwrcoequHE4
	 6yfYY7ZAAkcQvFw97630lzoRgR0Ry213f7auLEUEbrfEG4friZA4S/nML7J7VgVbnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717832;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=A4bNmGzPUft+bl2hd8oRtaUGmDxT0eDv2+FKZP+8TJg=;
	b=TpRlLw5ZmSF8O4qUo4TCxfAieIk1sCbtayitLXSfoFHBowfwUnb3pj7gU1pi6akvFXn6
	 fD7UN3aLNWsYN0R1SOKN8JNZ4frie+e57fZ48RnhQ/QlSlxZXjo91/TXuUYnPczf1UrHJ
	 is08ShJkUgvK2Hc9Og0mxFhFd/iKLkFARDCjmuIbMfEnTnDL98tf/j4wqCjob5lDlfWJT
	 Vkd+0eCeAUTiAHO8UvFzBlh2PpKzjVLc1pdG1fpSZYX0ClMNK1hEntAv9P5RcKD50QirI
	 0t+kuMIkC4C+CEbxze0d4hS3e+RoUka4u0FDUJHiZrwVduCZDpimeX4soFIJccVwDTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cjdns.fr;
	spf=none smtp.mailfrom=cjdns.fr;
	dkim=pass header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=TMtWkqkA;
	arc=none smtp.remote-ip=5.135.140.105
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE61606B259
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 14:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEE61606B259
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=TMtWkqkA
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35C16278CDF;
	Tue,  3 Nov 2026 15:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793717828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=A4bNmGzPUft+bl2hd8oRtaUGmDxT0eDv2+FKZP+8TJg=;
	b=TMtWkqkA1MgODNkA+UcgsAvQC4JSAAQU6CKGwEYtgnJGf1lZ68m8qRL1YrHSUu6g3O/+iZ
	7IkmlsIwNvULwxrfJTjszywsaBQzQTAUkPfHn99bkN9Y1+WUNkpibL4wS3OjcjXohyu2lQ
	TZe3zURWJs9zHMuUsqm1T01WdTbzx9C5TPqEF8pWJ1+v+rH5h0Nq3q8N1hWh8frhtKEtgS
	1Oz3HM0zaYirAeJwM7a8rriLq1EIafe9f0frwPkYtg4JqixrZJ7QXni7U5XEcoOOVqBM5l
	HR4eE2qSPJ3a2A79IEur64ppSV3klK+rBzJrqfs+V+z8l9UpVfoNeMAwmO484A==
Message-ID: <3624a201-be82-423f-ac96-7ab530e7918e@cjdns.fr>
Date: Tue, 3 Nov 2026 15:57:06 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 3/7] net: dsa: mediatek: add support for passthrough
 mode
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-4-cjd@cjdns.fr> <sashiko-outbox-191438@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <sashiko-outbox-191438@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 30/10/2026 20:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] net: dsa: mt7530: mt753x_check_passthrough() breaks dual-CPU-port boards
> - [High] net: dsa: mt7530: mt753x_trap_frames() blocks CPU control frames in passthrough
> - [High] net: dsa: mt7530: downstream switch callbacks assume local CPU port
> - [Medium] net: dsa: mt7530: setup overwrites PVC_EG_TAG on passthrough CPU port
> - [Medium] net: dsa: mt7530: mt7530_port_enable() ignores per-port CPU conduit
> --
>
> commit 89ff16dda9d512576bf6153ac6b119283ed62bea
> Author: Caleb James DeLisle <cjd@cjdns.fr>
>
> net: dsa: mediatek: add support for passthrough mode
>
> This commit adds passthrough mode support for MT7530 switches so that an
> upstream SoC-integrated switch can pass traffic to and from a downstream
> MT7530 switch without altering the MediaTek DSA tag.
>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index d10194488bdee..c5b3b00acb956 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
> [ ... ]
>
>> @@ -1286,13 +1297,81 @@ mt753x_trap_frames(struct mt7530_priv *priv)
>>   				   TO_CPU_FW_CPU_ONLY);
>>   }
> [ ... ]
>
>> +/* If this switch is downstream of another switch that is in passthrough mode,
>> + * the "CPU" port is actually a DSA port.
>> + */
>>   static void
>>   mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>>   {
>>   	struct mt7530_priv *priv = ds->priv;
>>   
>> -	/* Enable Mediatek header mode on the cpu port */
>> -	regmap_write(priv->regmap, MT7530_PVC_P(port), PORT_SPEC_TAG);
>> +	if (priv->is_passthrough) {
>> +		/* Disable parsing of the DSA tag, it will be forwarded blindly
>> +		 * to the downstream switch.
>> +		 */
>> +		regmap_write(priv->regmap, MT7530_PVC_P(port),
>> +			     VLAN_ATTR(MT7530_VLAN_TRANSPARENT) |
>> +			     PVC_EG_TAG(MT7530_VLAN_EG_DISABLED));
>> +
>> +		/* The port is not configured to parse DSA tags, so they are
>> +		 * liable to be confused for length fields, so length check is
>> +		 * disabled.
>> +		 */
>> +		regmap_clear_bits(priv->regmap, MT753X_AGC, AGC_L2LEN_CHK);
>> +
>> +		/* In passthrough mode, MTU is only enforced downstream */
>> +		mt7530_port_change_mtu(ds, port, MT7530_MAX_MTU);
>> +
>> +		/* Loop detection has no value in passthrough mode */
>> +		regmap_set_bits(priv->regmap, MT753X_MTRAP,
>> +				MT7530_LOOP_DET_DISABLE);
>> +	} else {
>> +		/* Not passthrough, enable DSA tag handling on CPU port. */
>> +		regmap_write(priv->regmap, MT7530_PVC_P(port), PORT_SPEC_TAG);
>> +	}
>>   
>>   	/* Enable flooding on the CPU port */
>>   	regmap_set_bits(priv->regmap, MT753X_MFC,
>> @@ -1322,6 +1401,7 @@ static int
>>   mt7530_port_enable(struct dsa_switch *ds, int port,
>>   		   struct phy_device *phy)
>>   {
>> +	int upstream_pt = dsa_switch_upstream_port(ds);
>>   	struct dsa_port *dp = dsa_to_port(ds, port);
>>   	struct mt7530_priv *priv = ds->priv;
>>   
>> @@ -1332,13 +1412,38 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
>>   	 * bridge.
>>   	 */
>>   	if (dsa_port_is_user(dp)) {
>> -		struct dsa_port *cpu_dp = dp->cpu_dp;
>> +		priv->ports[port].pm |= PCR_MATRIX(BIT(upstream_pt));
>>   
>> -		priv->ports[port].pm |= PCR_MATRIX(BIT(cpu_dp->index));
> [Severity: Medium]
> On switches with multiple CPU ports (such as MT7531 where per-port conduit
> assignment is supported via mt753x_port_change_conduit()), does replacing
> dp->cpu_dp->index with dsa_switch_upstream_port(ds) in mt7530_port_enable()
> connect a user port to the wrong CPU port when its assigned conduit differs
> from that of the first available port?
>
> dsa_switch_upstream_port(ds) returns dsa_upstream_port(ds, dp->index) for the
> first available port on the switch rather than dsa_upstream_port(ds, port)
> for the port being enabled. When a user port assigned to the secondary CPU
> conduit is brought up via dsa_user_open() -> mt7530_port_enable(), shouldn't
> this use dsa_upstream_port(ds, port) instead?
>
> [ ... ]


This looks like a real problem. The CPU port can be changed and this 
won't track that. However, cpu_dp can point to a port on another switch, 
so it's unreliable to use it for a port address directly. So I suppose 
the best solution is to use cpu_dp if it is local, otherwise use the 
first DSA port. Change conduit is not going to work with a cascaded 
switch, but it won't anyway because the CPU port is on another switch so 
it's already setup to error out.


>
>> @@ -2511,7 +2671,7 @@ mt7530_setup(struct dsa_switch *ds)
>>   		/* Disable learning by default on all ports */
>>   		regmap_set_bits(priv->regmap, MT7530_PSC_P(i), SA_DIS);
>>   
>> -		if (dsa_is_cpu_port(ds, i)) {
>> +		if (dsa_is_upstream_port(ds, i)) {
>>   			mt753x_cpu_port_enable(ds, i);
>>   		} else {
>>   			mt7530_port_disable(ds, i);
> [Severity: Medium]
> In both mt7530_setup() and mt7531_setup_common(), mt753x_cpu_port_enable()
> sets MT7530_PVC_P(port) with PVC_EG_TAG(MT7530_VLAN_EG_DISABLED) when
> priv->is_passthrough is true, but right after the if/else block in the loop:
>
> drivers/net/dsa/mt7530.c:mt7530_setup() {
>      ...
> 		if (dsa_is_upstream_port(ds, i)) {
> 			mt753x_cpu_port_enable(ds, i);
> 		} else {
> 			mt7530_port_disable(ds, i);
>
> 			/* Set default PVID to 0 on all user ports */
> 			regmap_update_bits(priv->regmap, MT7530_PPBV1_P(i),
> 					   G0_PORT_VID_MASK, G0_PORT_VID_DEF);
> 		}
> 		/* Enable consistent egress tag */
> 		regmap_update_bits(priv->regmap, MT7530_PVC_P(i),
> 				   PVC_EG_TAG_MASK,
> 				   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
>      ...
> }
>
> Doesn't this unconditionally overwrite PVC_EG_TAG_MASK on the passthrough
> upstream CPU port with MT7530_VLAN_EG_CONSISTENT, since mt7530_port_enable()
> only rewrites MT7530_PVC_P(port) for the downstream DSA link port?


It does, but PVC_EG_TAG(MT7530_VLAN_EG_DISABLED) is not set because the 
intent is that it will not be overwritten but rather because it's equal 
to zero so leaving it or omitting it from the write statement have the 
same effect.


>
> [Severity: High]
> Also in mt7530_setup() and mt7531_setup_common(), mt753x_trap_frames(priv)
> is still called unconditionally even when priv->is_passthrough is true:
>
> drivers/net/dsa/mt7530.c:mt753x_trap_frames() {
> 	regmap_update_bits(priv->regmap, MT753X_BPC,
> 			   PAE_BPDU_FR | PAE_EG_TAG_MASK | PAE_PORT_FW_MASK |
> 				   BPDU_EG_TAG_MASK | BPDU_PORT_FW_MASK,
> 			   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_DISABLED) |
> 				   PAE_PORT_FW(TO_CPU_FW_CPU_ONLY) |
> 				   BPDU_EG_TAG(MT7530_VLAN_EG_DISABLED) |
> 				   TO_CPU_FW_CPU_ONLY);
>      ...
> }
>
> On a normal switch, PORT_SPEC_TAG is enabled on the CPU port so frames sent
> by the CPU are directed by the MediaTek special tag. On a passthrough switch,
> mt753x_cpu_port_enable() leaves PORT_SPEC_TAG unset on the CPU port so frames
> are forwarded via the port matrix.
>
> When the CPU transmits STP BPDUs, 802.1X PAE, LACP, PAUSE, or LLDP frames
> (matching 01:80:c2:00:00:00/01/02/03/0e in BPC, RGAC1, and RGAC2) towards a
> downstream switch port, won't those frames ingressing the passthrough
> switch's CPU port match the trap rules and be restricted to
> TO_CPU_FW_CPU_ONLY (the passthrough switch's own CPU port) instead of being
> forwarded to the downstream DSA link port?
>
> [ ... ]


Makes sense to skip mt753x_trap_frames() if passthrough.


>
>> @@ -3304,7 +3472,7 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
>>   
>>   	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
>>   	 * forwarded to the numerically smallest CPU port whose conduit
>> -	 * interface is up.
>> +	 * interface is up. NOTE: "CPU port" can also mean an upstream DSA link.
>>   	 */
>>   	if (priv->id != ID_MT7530 && priv->id != ID_MT7621 &&
>>   	    priv->id != ID_EN7528)
> [Severity: High]
> On the downstream switch behind a passthrough switch, the upstream port is a
> DSA link port (DSA_PORT_TYPE_DSA) rather than a CPU port (DSA_PORT_TYPE_CPU),
> and dp->cpu_dp / conduit->dsa_ptr point to the CPU port on the upstream
> switch. How are the following paths handled on the downstream switch?
>
> First, in mt753x_conduit_state_change(), mt7530_update_port_member(), and
> mt7530_port_vlan_filtering(), the code uses cpu_dp->index directly:
>
> drivers/net/dsa/mt7530.c:mt753x_conduit_state_change() {
> 	struct dsa_port *cpu_dp = conduit->dsa_ptr;
>      ...
> 	mask = BIT(cpu_dp->index);
> }
>
> drivers/net/dsa/mt7530.c:mt7530_update_port_member() {
> 	struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
> 	struct mt7530_port *p = &priv->ports[port], *other_p;
> 	struct dsa_port *cpu_dp = dp->cpu_dp;
> 	u32 port_bitmap = BIT(cpu_dp->index);
>      ...
> }
>
> drivers/net/dsa/mt7530.c:mt7530_port_vlan_filtering() {
> 	struct dsa_port *dp = dsa_to_port(ds, port);
> 	struct dsa_port *cpu_dp = dp->cpu_dp;
>
> 	if (vlan_filtering) {
> 		mt7530_port_set_vlan_aware(ds, port);
> 		mt7530_port_set_vlan_aware(ds, cpu_dp->index);
>      ...
> }
>
> If the upstream switch's CPU port index differs from the downstream switch's
> upstream DSA link port index (for example, port 6 on the upstream switch vs
> port 5 on the downstream switch), won't these program the wrong port on the
> downstream switch?


Probably best to write an mt753x_get_upstream_port() which uses CPU port 
if local, otherwise first DSA. This can be used everywhere.


>
> Second, when a VLAN is added or deleted on the downstream switch, DSA calls
> mt7530_port_vlan_add() and mt7530_port_vlan_del() on the downstream switch's
> upstream DSA link port (passing the user port's untagged and pvid flags). In
> mt7530_hw_vlan_add():
>
> drivers/net/dsa/mt7530.c:mt7530_hw_vlan_add() {
>      ...
> 	if (dsa_port_is_cpu(dp))
> 		val = MT7530_VLAN_EGRESS_STACK;
> 	else if (entry->untagged)
> 		val = MT7530_VLAN_EGRESS_UNTAG;
> 	else
> 		val = MT7530_VLAN_EGRESS_TAG;
> 	regmap_update_bits(priv->regmap, MT7530_VAWD2,
> 			   ETAG_CTRL_P_MASK(entry->port),
> 			   ETAG_CTRL_P(entry->port, val));
> }
>
> Because dsa_port_is_cpu(dp) is false for the downstream switch's upstream DSA
> link port, won't mt7530_hw_vlan_add() fail to set MT7530_VLAN_EGRESS_STACK
> and instead set UNTAG or TAG, while mt7530_port_vlan_add() and
> mt7530_port_vlan_del() also overwrite PVID and ACC_FRM_MASK on the upstream
> port?


if (dp == mt753x_get_upstream_port(ds)) seems like it would fix this.


>
> [ ... ]
>
>> @@ -3399,6 +3574,99 @@ static int mt7988_setup(struct dsa_switch *ds)
>>   	return mt7531_setup_common(ds);
>>   }
>>   
>> +/* 1 if passthrough, negative if error. */
>> +static int mt753x_check_passthrough(struct device *dev)
>> +{
>> +	struct device_node *ports, *port;
>> +	int passthrough_ports = 0;
>> +	int enabled_ports = 0;
>> +
>> +	ports = of_get_child_by_name(dev->of_node, "ports");
>> +	if (!ports)
>> +		ports = of_get_child_by_name(dev->of_node, "ethernet-ports");
>> +
>> +	if (!ports) {
>> +		dev_err(dev, "no ports child node found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	for_each_available_child_of_node(ports, port) {
>> +		struct device_node *link;
>> +
>> +		enabled_ports++;
>> +
>> +		link = of_parse_phandle(port, "ethernet", 0);
>> +		if (!link)
>> +			link = of_parse_phandle(port, "link", 0);
>> +
>> +		if (!link)
>> +			continue;
>> +
>> +		of_node_put(link);
>> +
>> +		passthrough_ports++;
>> +	}
>> +
>> +	of_node_put(ports);
>> +
>> +	/*
>> +	 * A switch is considered passthrough if exactly two available
>> +	 * ports have an "ethernet" or "link" phandle.
>> +	 */
>> +	if (passthrough_ports > 2 ||
>> +	    (passthrough_ports == 2 && enabled_ports != 2)
>> +	) {
>> +		dev_err(dev, "Only two ports allowed in passthrough mode\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return passthrough_ports == 2;
>> +}
> [Severity: High]
> What happens in mt7530_probe_common() -> mt753x_check_passthrough() on
> standalone dual-CPU-port boards where two ports (such as port@5 and port@6)
> both have "ethernet" phandles and no port has a "link" phandle?
>
> Because mt753x_check_passthrough() counts both "ethernet" and "link" phandles
> into passthrough_ports without checking whether any "link" phandle is
> present, passthrough_ports is 2 whenever two CPU ports are enabled. If any
> user ports are also enabled (enabled_ports > 2, as on mt7621, mt7622,
> mt7623n, and mt7986 dual-CPU-port boards), doesn't mt753x_check_passthrough()
> return -EINVAL and abort the switch probe? And if all user ports happen to be
> disabled (enabled_ports == 2), wouldn't it falsely enable passthrough mode on
> a switch with two CPU ports and no downstream switch?


Indeed, that's a problem. I think passthrough should not be enabled if 
there are multiple ethernet ports, but it should not be excluded.


Keeping these notes to send a v5.


Thanks,

Caleb


