Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7C635C1B2
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252803; cv=none; b=N81sGRO7+1QtjdOan/5DOUe7vACpxm5qgBviZW9dMYS+XkUx8RamV0hk1x3CH9Z9/wDY1er+UCCUPX/VyXN9oMVNqEQjeXA1HhJ6OMLr4qb6a7FQMtZSOow1xmLLmBlbFOtfY0Xbb/jwr/2Ug48P0lGfgGBbFdKW1Xi04VP4ihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252803; c=relaxed/simple;
	bh=GbJTCnj/FJJtLtMUi1u/qqKYiZbzVkWSKterUbJVOIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=sS7DtJ3EfQhd8jJb0WAXpsmHnnzh/1Pyci48qEC5d4ggbse5hqnrFNqzrm1oxS9S6+LQeYZMOxsQ6VD6l7TJ/hXNI2UhXJ3joVJyJW2KdwgnhGNW/pCmt3XmBza6FkGvLhcfzb4XH9fASvWkhZ/1z7/m8FSeLx/QbGmjpr7xWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=t.fuechsel@gmx.de header.b=IpuDPKxg; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=t.fuechsel@gmx.de header.b="IpuDPKxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790252798; x=1790857598; i=t.fuechsel@gmx.de;
	bh=GbJTCnj/FJJtLtMUi1u/qqKYiZbzVkWSKterUbJVOIg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IpuDPKxgs5Havy1hvtvql0vtU9h2Qp00rJ/ZLuaAfbTCaTYJtUaUA10h1IUCmwhO
	 V5geVtFY+uK4uArJnQgBvViRlVFfxg8NAEWbA6BSwabnNbj47sn/fbaaqlayr/QIY
	 //pVMDLjThdbwJzZpgXz5xqTxsmDPqrWrrqmb9rglfLJXsPwvGnmZqM3qy/6/Pli1
	 XwZb5y+7EuouEhEkBNSP4PWzcpIJcDgl82EhgvLXLA/Wq2JZh8ooZaO+fPTR3kppi
	 tzj8uyyVdfWcGxqTcSpf9wdyDurL8O4YTQcuTiP7x61b4rqTYOYab42rWezRfE/4b
	 kD1tkEBZh6ntslUcwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLQxN-1xRetJ0tYh-00KePT; Thu, 24
 Sep 2026 14:26:38 +0200
Message-ID: <b701b65c-9f40-4001-a641-23162e7eb485@gmx.de>
Date: Thu, 24 Sep 2026 14:26:37 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv8 net-next] tcp: Add TCP ROCCET congestion control module.
To: sashiko-reviews@lists.linux.dev
References: <arK46Rr0cB7gJ7JS@volt-roccet-vm>
 <20260923172056.E154C1F00898@smtp.kernel.org>
Content-Language: en-US, de-DE
Cc: Lukas Prause <lukas.prause@ikt.uni-hannover.de>
From: =?UTF-8?Q?Tim_F=C3=BCchsel?= <t.fuechsel@gmx.de>
In-Reply-To: <20260923172056.E154C1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EUAXeL4Zf5zTBlgEhiXHn7aLsHQrpPa+wOZ6+wsHgbWibscQQZC
 djA9PcKa9E/B+OHItYYHNGPkZwG+pTg2b8OLvA3wDuC3yS/XcKSwru0j5YtUP4gI9Zhoo8R
 6Pfn3DXjkcSAdv7qyHcbY/folkpH0e5UGDrltt72LwzI2SF0u5fD0O49uxjmwpy4GJ4Z80A
 jlmEmhLrBGxZ4pnP16LPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:X9ZD0vGOM8A=;Bd8nMgmNnyAD98qT7lgEwxJ2qOv
 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
 +bWzhGtn61Por


Thanks for the review. We have some comments on the provided issues.

 >> +static void update_ack_rate(struct roccettcp *ca, u32 acked, u32 now)
 >> +{
 >> +=C2=A0 =C2=A0 const s32 idle_threshold =3D USEC_PER_SEC * 2;
 >> +=C2=A0 =C2=A0 const s32 interval =3D USEC_PER_MSEC * 100;
 >> +
 >> +=C2=A0 =C2=A0 /* Check if the last interval has elapsed.
 >> +=C2=A0 =C2=A0 =C2=A0*
 >> +=C2=A0 =C2=A0 =C2=A0* Check via time_between32, so that idle connecti=
ons
 >> +=C2=A0 =C2=A0 =C2=A0* (for more than U32_MAX/2 usecs), also trigger a=
 new update
 >> +=C2=A0 =C2=A0 =C2=A0* and don't stall the ack-counting.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 bool interval_elapsed =3D !time_between32(now, ca->last=
_ack_rate_time
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - interval,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ca->last_ack_rate_time
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 + interval);
 >> +
 >> +=C2=A0 =C2=A0 if (interval_elapsed) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check if the connection was idle for *=
idle_threshold*
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* seconds (e.g. no ACK for X second=
s). If so, reset the ack
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* counting as if a new connection w=
as created.
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!time_between32(now, ca->last_ack_rat=
e_time
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - idle_threshold,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ca->last_ack_rate_time
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 + idle_threshold)) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_last_rate =3D =
0;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->last_ack_rate_time =3D
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 jiffies_to_us=
ecs(tcp_jiffies32);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->curr_ack_rate =3D 0;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_cnt =3D 0;
 >
 > [Severity: Medium]
 > Are the newly received ACKs lost during idle period recovery?
 >
 > When recovering from an idle period, the ack_rate_cnt is zeroed, but=20
the acked
 > parameter is completely ignored. This appears to incorrectly=20
calculate the ACK
 > rate as zero for the first 100ms interval by discarding the first=20
burst of
 > ACKs.
When the connection is starting from idle, we do LAUNCH, as we handle this
connection as a newly created socket. Therefore we zero=20
ca->ack_rate_last_rate,
ca->curr_ack_rate, and the counter ca->ack_rate_cnt.
This is the intended behavior.


 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start counting for the n=
ew interval */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->last_ack_rate_time =3D =
now;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_last_rate =3D =
ca->curr_ack_rate;
 >
 > [ ... ]
 >
 >> +static void roccet_enter_min_rtt_probe(struct sock *sk, u32 now)
 >> +{
 >> +=C2=A0 =C2=A0 struct tcp_sock *tp =3D tcp_sk(sk);
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +=C2=A0 =C2=A0 u32 interval, probe_cwnd;
 >> +
 >> +=C2=A0 =C2=A0 /* If probing is already set, there was a mix up.
 >> +=C2=A0 =C2=A0 =C2=A0* Continue anyway so we can recover.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (ca->rtt_probe_timers_set)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn_once("TCP ROCCET: Probing time sh=
ould not be set=20
when entering RTT Probe\n");
 >> +
 >> +=C2=A0 =C2=A0 /* Safeguard for an "infinite" probe. This should logic=
ally never
 >> +=C2=A0 =C2=A0 =C2=A0* happen but still safeguard it.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (ca->curr_rtt =3D=3D U32_MAX) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn_once("TCP ROCCET: curr_rtt is U32=
_MAX, cannot enter=20
RTT_PROBE\n");
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->state =3D ORBITER;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
 >> +=C2=A0 =C2=A0 }
 >> +
 >> +=C2=A0 =C2=A0 /* Use field to store when we entered min RTT probing. =
Here we use
 >> +=C2=A0 =C2=A0 =C2=A0* jiffies to stay consistent with the epoch_start=
 format.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 ca->next_min_rtt_probe =3D tcp_jiffies32;
 >
 > [Severity: High]
 > Could an interrupted state transition leave a jiffies timestamp=20
permanently
 > stranded in the next_min_rtt_probe field?
 >
 > In roccet_enter_min_rtt_probe(), next_min_rtt_probe is overloaded with =
a
 > tcp_jiffies32 value. If a packet loss or ECN triggers=20
roccet_congestion_event()
 > while in RTT_PROBE_REFILL, the state shifts directly to DRAIN.
 >
 > When transitioning from DRAIN to ORBITER,=20
roccet_handle_state_transitions()
 > fails to rewrite this timestamp (since prev_state is DRAIN, not a probe
 > state). Could this trap the connection in an infinite RTT_PROBE_ENTER=
=20
loop
 > when ORBITER compares a large microsecond now against this small jiffie=
s
 > value?
This is an unhandled transition in the state-machine and will be fixed.


 >> +
 >> +=C2=A0 =C2=A0 /* Start min RTT probing */
 >
 > [ ... ]
 >
 >> +static void roccet_orbiter_update(struct sock *sk, u32 acked)
 >> +{
 >> +=C2=A0 =C2=A0 /* ORBITER: Increase the cwnd by using the CUBIC cwnd g=
rowth=20
function,
 >> +=C2=A0 =C2=A0 =C2=A0* if no roccet congestion event is detected.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +
 >> +=C2=A0 =C2=A0 struct tcp_sock *tp =3D tcp_sk(sk);
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +
 >> +=C2=A0 =C2=A0 u32 now =3D jiffies_to_usecs(tcp_jiffies32);
 >> +=C2=A0 =C2=A0 bool evaluate_srrtt =3D false;
 >> +=C2=A0 =C2=A0 bool sent_more_than_acked =3D false;
 >> +=C2=A0 =C2=A0 u32 roccet_xj, jitter, sent, received;
 >> +
 >> +=C2=A0 =C2=A0 /* Enter DRAIN when roccet was recently triggered */
 >> +=C2=A0 =C2=A0 if (ca->last_event_time_set &&
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 time_before32(now, ca->roccet_last_event_=
time_us +
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 100 * USEC_PER_MSEC)=
) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->state =3D DRAIN;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
 >> +=C2=A0 =C2=A0 }
 >
 > [Severity: High]
 > Can jiffies_to_usecs() overflow and trap the connection in DRAIN?
 >
 > At HZ=3D1000, jiffies_to_usecs(tcp_jiffies32) wraps around 32 bits=20
every ~71.58
 > minutes. If a connection lives for more than 35.79 minutes (2^31=20
microseconds)
 > without a congestion event, the time delta flips sign, causing=20
time_before32()
 > to erroneously evaluate to true on every subsequent packet.
This is a very unlikely case, which can however be prevented by using a=20
range
check using time_between32. This will be done in a future version, includi=
ng
other potentially problematic areas which are currently checking usec-time=
s
using the time_before32 and time_after32 functionality.


 >> +
 >> +=C2=A0 =C2=A0 /* Enter RTT_PROBE when the "timer" has expired.
 >
 > [ ... ]
 >
 >> +=C2=A0 =C2=A0 /* Calculate if more bytes were sent than received
 >> +=C2=A0 =C2=A0 =C2=A0* in the time interval.
 >> +=C2=A0 =C2=A0 =C2=A0*
 >> +=C2=A0 =C2=A0 =C2=A0* Handle wrap arounds by relying on unsigned subt=
raction.
 >> +=C2=A0 =C2=A0 =C2=A0* e.g. if snd_nxt wraps to 10 and seq_start is U3=
2_MAX - 10,
 >> +=C2=A0 =C2=A0 =C2=A0* the subtraction will result in the value of 21.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 sent =3D tp->snd_nxt - ca->interval_snd_seq_start;
 >> +=C2=A0 =C2=A0 received =3D tp->snd_una - ca->interval_una_seq_start;
 >> +
 >> +=C2=A0 =C2=A0 /* Check sent and received bytes from the previous inte=
rval.
 >> +=C2=A0 =C2=A0 =C2=A0* Here we use a guard space of 1% of the current =
cwnd.
 >> +=C2=A0 =C2=A0 =C2=A0* We do this to avoid a false positive evaluation=
 due
 >> +=C2=A0 =C2=A0 =C2=A0* to delays caused by jitter or scheduling.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 sent_more_than_acked =3D
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sent >
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 received + ((tcp_snd_cwnd(tp) * tp->mss_c=
ache) / 100);
 >
 > [Severity: Medium]
 > Can the multiplication of tcp_snd_cwnd(tp) and tp->mss_cache overflow=
=20
here?
 >
 > Since both are 32-bit unsigned integers, connections with high
 > bandwidth-delay products or large MTUs (e.g., Loopback with 64KB MSS) c=
an
 > easily exceed 4.29 billion before the division by 100 occurs. This=20
overflow
 > could falsely trigger a ROCCET congestion event and needlessly limit
 > throughput.
Although this could theoretically happen in the provided scenario, this=20
would
still require a huge cwnd. A fix for this is to simply use a div_u64=20
operation,
however this is not critical and can be adressed in a future update.

In addition this scenario is not meant to be handled by ROCCET.
Transmitting data over the loopback interface at these data rates using TC=
P,
where the u32 overflow could happen, is, in general, an unlikely scenario.


 >> +
 >> +=C2=A0 =C2=A0 /* Check if it's time to evaluate the srRTT */
 >
 > [ ... ]
 >
 >> +static u32 roccet_recalc_ssthresh(struct sock *sk)
 >> +{
 >> +=C2=A0 =C2=A0 const struct tcp_sock *tp =3D tcp_sk(sk);
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +=C2=A0 =C2=A0 u32 cwnd =3D tcp_snd_cwnd(tp);
 >> +
 >> +=C2=A0 =C2=A0 /* In LAUNCH, we want no reduction on loss/ECN.
 >> +=C2=A0 =C2=A0 =C2=A0* On ECN this is set later on in roccet_state()
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (ca->state =3D=3D LAUNCH)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cwnd;
 >
 > [Severity: High]
 > By returning cwnd unchanged instead of scaling it down during fast=20
recovery,
 > does this ignore packet drops in the initial slow start phase?=20
Refusing to
 > back off when router buffers overflow appears to violate RFC 5681 and=
=20
could
 > risk severe congestion collapse.
This procedure is described in the research paper mentioned in the commit
message and is intended behaviour.
ROCCET is reacting to loss in LAUNCH by entering the congestion avoidance
phase. Additional losses would be handled as a congestion event, causing a
cwnd reduction.


 >> +
 >> +=C2=A0 =C2=A0 /* In min RTT probe, use the cwnd before the probe to n=
ot=20
undershoot */
 >
 > [ ... ]
 >
 >> +static void roccet_state(struct sock *sk, u8 new_state)
 >> +{
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +=C2=A0 =C2=A0 struct tcp_sock *tp =3D tcp_sk(sk);
 >> +=C2=A0 =C2=A0 u32 cwnd;
 >> +=C2=A0 =C2=A0 u32 now =3D jiffies_to_usecs(tcp_jiffies32);
 >> +=C2=A0 =C2=A0 enum roccet_state prev_state =3D ca->state;
 >> +
 >> +=C2=A0 =C2=A0 if (new_state =3D=3D TCP_CA_Loss) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 roccet_reset(sk, ca);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_snd_cwnd_set(tp, TCP_INIT_CWND);
 >> +=C2=A0 =C2=A0 } else if (new_state =3D=3D TCP_CA_CWR) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Handle CWR as ROCCET congestion event,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* however afterwards always set Wma=
x to the current cwnd
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* except during min RTT probing.
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwnd =3D tcp_snd_cwnd(tp);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 roccet_congestion_event(sk, now);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ca->state !=3D RTT_PROBE_ENTER && ca-=
>state !=3D RTT_PROBE &&
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->state !=3D RTT_PROBE_RE=
FILL)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->last_max_cwnd =3D cwnd;
 >> +=C2=A0 =C2=A0 } else if (new_state =3D=3D TCP_CA_Recovery) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Directly reduce cwnd and rely on pacin=
g */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwnd =3D roccet_handle_recovery(sk);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_snd_cwnd_set(tp, cwnd);
 >> +=C2=A0 =C2=A0 }
 >
 > [Severity: High]
 > Does instantly halving the congestion window here bypass the internal
 > Proportional Rate Reduction (PRR) pacing mechanisms? By directly mutati=
ng
 > snd_cwnd inside the state machine callback, it appears the sender=20
could be
 > artificially blocked from transmitting until a full half-window of ACKs
 > drains, causing large transmission stalls.
We are not bypassing PRR. We are implementing our own alternative to PRR=
=20
with
a strict pacing policy in cong_control.


 >> +
 >> +=C2=A0 =C2=A0 roccet_handle_state_transitions(sk, prev_state, now);
 >
 > [ ... ]
 >
 >> +static int __init roccet_register(void)
 >> +{
 >> +=C2=A0 =C2=A0 int param_err;
 >> +
 >> +=C2=A0 =C2=A0 BUILD_BUG_ON(sizeof(struct roccettcp) > ICSK_CA_PRIV_SI=
ZE);
 >
 > [Severity: Low]
 > Will this compile-time assertion fail deterministically?
 >
 > The struct roccettcp requires 108 bytes of storage (24 u32s =3D 96 byte=
s,
 > 3 u16s =3D 6 bytes, 2 bytes padding to align the 4-byte enum bitfield,=
=20
making
 > 108 bytes). The BUILD_BUG_ON() enforces a 104-byte limit for
 > ICSK_CA_PRIV_SIZE, which would cause a build failure on all platforms.
 >
 >> +
 >> +=C2=A0 =C2=A0 /* Check for valid parameter ranges and then precompute=
 factors */
 >
According to our understanding and tests this is not the case.

