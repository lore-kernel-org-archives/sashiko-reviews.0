Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11F03AA1BF
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738011; cv=none; b=D/h94BgYJFUvDe2clAJbH0jNLSniikQqaPRNmPSNeKkiDo1Fvfv+LWTHmGFSBTwmEP/PyBsibTzpS7V+QkP9hE7CnV6gAJzESAKcV0g3p/Sedey/IUaTdmFkgZ3EB3tG57xs4pltNPeSR2pnA3jT1sCcQMb6O/rIwQHnuYZARgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738011; c=relaxed/simple;
	bh=NOTwsWzXOmyD0/CxiEG0tUMydvMebTcbIaw/9OKVpkI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ktc27EZCav47jp49GMvrV46cljmAJoNGSQRpCk2UzkvwJpoLAm4gxSQT3JsGi1w3ON8vAF9Sts1ZMJoEiNQ2thLXdmHY9HrMInqyeCQpHp7GcONJcX91Eo+kh3St56U6SIi2dvLwisNAJVt7YcRqcfl6J8pUGar/aYpoMt6CtJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=t.fuechsel@gmx.de header.b=DQT/D8u6; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=t.fuechsel@gmx.de header.b="DQT/D8u6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1789738006; x=1790342806; i=t.fuechsel@gmx.de;
	bh=NOTwsWzXOmyD0/CxiEG0tUMydvMebTcbIaw/9OKVpkI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 References:In-Reply-To:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DQT/D8u6todEgbDmam+4vIBn0ngVMWPwIPcdIppFS5Wu1dSecIUXqwejLnivlY7q
	 xMmd+3WqqdsAqb0S3LF7Uj4cMvJ7rEfeJ/IGDXx1UUQRfhfLXTH0oG+PRDVY2xL9w
	 V0CiczgD3yEEpuLi8rlLHDXBLN/aGpk86I5goJBxv3xGE+rO8+Q+rlOo9pTEPneOe
	 RTlr1ijC5Cq9+O9HlYwJqZyvlpK9G2WvJHUaikixGLtaSBYLZL6oAYqVzzOuYeSAw
	 vRReryA/Yu6cjo+gtz0mRg6RMKQNXVdJuGkQzq485+982ez7r5BpaN14ZebvvBEQN
	 EERZL0xpbrqEja64/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XU1-1wlRMV26G9-013WFT for
 <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 15:26:46 +0200
Message-ID: <306f4bc1-2859-4f4e-a3fe-7e8490d6bd41@gmx.de>
Date: Fri, 18 Sep 2026 15:26:46 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Tim_F=C3=BCchsel?= <t.fuechsel@gmx.de>
Subject: Re: [PATCHv6 net-next] tcp: Add TCP ROCCET congestion control module.
To: sashiko-reviews@lists.linux.dev
References: <aqqGU0XfcfsI-OGy@volt-roccet-vm>
 <20260917120715.7BEC31F000FF@smtp.kernel.org>
Content-Language: en-US, de-DE
In-Reply-To: <20260917120715.7BEC31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EmNtW9T7leq92RFNrWYk/W4QSIpgsVoz5MKzN9t1o3Ccu6PjvdB
 ofiSC+wZE+yi8oPMYDE7pdPmsO2RPG31nO5gTW1CMhXqdbQTCrbaekTeB7F8z8VLBWkn3GR
 3T7jwfpWvVyC/eXGj5Bw6feJAR1GfgXooN2/8h5KVh7i027MTEVoKT78hdb8wGXGWNsRhDK
 ibKgxGlg08D17v6RoN4Hg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:70Kkj7hoL2A=;/4hwOlX/5Da7MPHcNknPSCdMIGc
 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

Hello,

thanks for the review. We have several comments on the issues and
kindly ask for clarification on some of the findings.

 > [ ... ]
 >> +struct roccettcp {
 >> +=C2=A0 =C2=A0 u32 cnt;=C2=A0 =C2=A0 /* increase cwnd by 1 after ACKs =
*/
 > [ ... ]
 >> +=C2=A0 =C2=A0 u16 ack_rate_cnt;=C2=A0 =C2=A0 /* Used for counting ack=
s */
 >> +
 >> +=C2=A0 =C2=A0 enum roccet_state state : 3; /* Current operating state=
 of=20
roccet */
 >
 > [Severity: Low]
 > Does the transition from u16 to an enum bitfield force a 4-byte alignme=
nt
 > here?
 >
 > It appears this introduces 2 bytes of padding, expanding the struct=20
beyond
 > 104 bytes and causing the BUILD_BUG_ON(sizeof(struct roccettcp) >
 > ICSK_CA_PRIV_SIZE) assertion in roccet_register() to fail at compile=20
time.
We will fix this by switching some variables to do the alignment.

 > [ ... ]
 >> +static int beta __read_mostly =3D 717; /* =3D 717/1024=20
(BICTCP_BETA_SCALE) */
 > [ ... ]
 >> +module_param(beta, int, 0644);
 >
 > [Severity: Medium]
 > Since beta is writable by root at runtime (0644), shouldn't there be a
 > runtime bounds validation check?
 >
 > The current param_check() is only executed during initialization. If be=
ta
 > is written to a negative value at runtime, it could cause an unsigned
 > integer overflow in roccet_congestion_event() during congestion window
 > scaling calculations.
This is part of CUBIC's code, but we will adjust it.

 > [ ... ]
 >> +static void update_ack_rate(struct roccettcp *ca, u32 acked, u32 now)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start counting for the n=
ew interval */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_last_rate_time=
 =3D now;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_last_rate =3D =
ca->ack_rate_curr_rate;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_curr_rate =3D =
ca->ack_rate_cnt;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_cnt =3D min_t(=
u32, acked, U16_MAX);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
 >> +
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->was_idle =3D false;
 >> +=C2=A0 =C2=A0 } else {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Cap the ack count to avoid overflow */
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_rate_cnt =3D min_t(u32, ca->ack_r=
ate_cnt + acked,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0U16_MAX);
 >
 > [Severity: High]
 > Does artificially capping this measurement to U16_MAX flatten the track=
ed
 > rate on high-speed networks?
 >
 > On networks exceeding ~7.8 Gbps, the connection will receive more than
 > 65535 ACKs per 100ms interval. This saturation would constantly yield a
 > rate difference of 0, falsely signaling that throughput has plateaued a=
nd
 > causing roccet_launch_update() to prematurely abort slow start.
We discussed this in a previous review. This case is unlikely for cellular
links, but it might happen in other networks. Here, this causes no harm
because ROCCET would exit LAUNCH, without fully utilising the pipe, and
enter the congestion avoidance phase.

 > [ ... ]
 >> +static void roccet_congestion_event(struct sock *sk, u32 now)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 ca->epoch_start =3D 0;
 >> +=C2=A0 =C2=A0 ca->roccet_last_event_time_us =3D now;
 >
 > [Severity: High]
 > Can this assign a wrapping microsecond timestamp to a field that later
 > treats 0 as a special uninitialized sentinel?
 >
 > The 32-bit microsecond timestamp generated in roccet_control() will wra=
p
 > to exactly 0 every ~6.2 days. If a congestion event occurs at that=20
precise
 > millisecond, roccet_last_event_time_us becomes 0.
 >
 > This would cause roccet_drain_update() to bypass its interval check
 > permanently, trapping the connection in the DRAIN state.
We will investigate this and fix it, but we think it is really unlikely to
occur. For this, the socket has to be a lifetime of ~6.2 days, and the
event has a vulnerability period of 1ms.

 > [ ... ]
 >> +static void roccet_min_rtt_probe(struct sock *sk, u32 now)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 if (ca->probe_min_rtt_until =3D=3D 0)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn_once("ROCCET: Probing time should=
 be set");
 >> +=C2=A0 =C2=A0 else if (time_before32(now, ca->probe_min_rtt_until))
 >
 > [Severity: High]
 > Could this sentinel check falsely trigger if the calculated deadline=20
wrapped
 > to exactly 0?
 >
 > Similar to the issue above, because it treats 0 as uninitialized, a pro=
be
 > duration that naturally lands on 0 during wraparound will mysteriously
 > abort the min RTT probing phase.
We will investigate this and fix it.

 > [ ... ]
 >> +static void roccet_launch_update(struct sock *sk, u32 acked)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 /* If cwnd hits ssthresh, go to ORBITER and if any ACKs=
 are
 >> +=C2=A0 =C2=A0 =C2=A0* leftover save them for ORBITER.
 >> +=C2=A0 =C2=A0 =C2=A0* Check via tcp_in_slow_start() in case no ACKs a=
re left.
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (!tcp_in_slow_start(tp)) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->state =3D ORBITER;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->epoch_start =3D 0;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->ack_carry_over =3D acked;
 >> +=C2=A0 =C2=A0 }
 >> +}
 >
 > [Severity: Medium]
 > When leftover ACKs are saved in ack_carry_over, are they ever applied t=
o
 > the actual congestion window growth?
 >
 > Looking at roccet_orbiter_update(), it calls bictcp_update() which adds
 > the carryover to ack_cnt, but that is only used for TCP friendliness
 > fallback calculations. The subsequent call to tcp_cong_avoid_ai() only
 > takes the current round's acked value, meaning the carried-over ACKs ar=
e
 > permanently discarded.
Yes, we will fix it.

 > [ ... ]
 >> +static void roccet_orbiter_update(struct sock *sk, u32 acked)
 >> +{
 > [ ... ]
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
 >
 > [Severity: Medium]
 > Will this calculation be subject to catastrophic 32-bit sequence=20
wrap-around
 > on networks operating at 100+ Gbps?
 >
 > Since this measures bytes transferred over a 5 RTT measurement window,
 > transferring more than 4 Gigabytes in that time will wrap the 32-bit
 > sequence subtraction and break the sent_more_than_acked evaluation.
To be honest, I do not know what to answer here. The whole TCP stack is no=
t
suitable to maintain 100+ Gbps with a single flow.
For these data rates, other technologies are used. I am not even sure
if it is possible at the moment to reach these data rates with a single
sender.

 > [ ... ]
 >> +static u32 roccet_recalc_ssthresh(struct sock *sk)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 /* In LAUNCH, we want no reduction on loss/ECN.
 >> +=C2=A0 =C2=A0 =C2=A0* On ECN this is set later on in roccet_state()
 >> +=C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 if (ca->state =3D=3D LAUNCH)
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cwnd;
 >
 > [Severity: High]
 > Does forcing ssthresh to remain at the full congestion window size=20
despite
 > an active congestion event bypass standard congestion control safeguard=
s?
 >
 > Ignoring packet loss during the LAUNCH slow-start phase entirely preven=
ts
 > the sender from backing off during severe congestion, which can lead to
 > persistent buffer overflow.
That is quite correct. On packet loss in LAUNCH, we switch to the congesti=
on
avoidance phase, ORBITER. Packet loss is not ignored here.

 > [ ... ]
 >> +static u32 roccet_handle_recovery(struct sock *sk)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 /* On loss in LAUNCH, enter ORBITER without a cwnd redu=
ction. */
 >> +=C2=A0 =C2=A0 if (ca->state =3D=3D LAUNCH) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->state =3D ORBITER;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cwnd;
 >> +=C2=A0 =C2=A0 }
 >
 > [Severity: High]
 > Does returning the unreduced cwnd intentionally circumvent standard cwn=
d
 > reduction upon Fast Recovery during the initial growth phase?
 >
 > As above, this completely ignores network congestion signals and violat=
es
 > TCP congestion control safety invariants.
That's incorrect. ROCCET is reacting to loss in LAUNCH and ORBITER.
In LAUNCH, the slow start is aborted, and ROCCET enters the congestion
avoidance phase. And in the congestion avoidance phase, ROCCET
reacts to loss like CUBIC.
We do not reduce the cwnd on loss in LAUNCH because loss in the beginning
of a TCP connection is mostly not related to congestion in cellular
networks. The detected loss mostly comes from layer 2 mechanisms.
In other networks, we would detect a loss instantly after leaving LAUNCH
and adjust the cwnd.

 > [ ... ]
 >> +static void roccet_state(struct sock *sk, u8 new_state)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 if (new_state =3D=3D TCP_CA_Loss) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 roccet_reset(sk, ca);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_snd_cwnd_set(tp, TCP_INIT_CWND);
 >
 > [Severity: High]
 > Does explicitly overriding the TCP core's safe cwnd reduction of 1 with
 > TCP_INIT_CWND cause severe congestion bursts?
 >
 > Injecting up to 10 packets immediately following a full Retransmission
 > Timeout violently floods an already deeply congested network.
Setting the cwnd on an RTO to the initial value of 10 segments is a common
procedure.

 >> +=C2=A0 =C2=A0 } else if (new_state =3D=3D TCP_CA_CWR) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Handle CWR as ROCCET congestion event,
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* however afterwards always set Wma=
x to the current cwnd.
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cwnd =3D tcp_snd_cwnd(tp);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 roccet_congestion_event(sk, now);
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->last_max_cwnd =3D cwnd;
 >> +=C2=A0 =C2=A0 } else if (new_state =3D=3D TCP_CA_Recovery) {
 >
 > [Severity: High]
 > Is the congestion window getting penalized twice for TCP_CA_CWR?
 >
 > The TCP core already halves cwnd prior to calling this state callback.
 > Passing the already-halved cwnd into roccet_congestion_event() triggers=
 a
 > redundant congestion event.
 >
 > Additionally, blindly assigning this doubly-penalized value to
 > last_max_cwnd permanently corrupts CUBIC's target growth metric.
We will investigate this. But in our understanding, the TCP stack is not
reducing the cwnd because we are implementing the cong_control function.

 > [ ... ]
 >> +static void roccet_acked(struct sock *sk, const struct ack_sample=20
*sample)
 >> +{
 > [ ... ]
 >> +=C2=A0 =C2=A0 /* Get valid sample for roccet */
 >> +=C2=A0 =C2=A0 if (sample->rtt_us > 0) {
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->last_rtt =3D ca->curr_rtt;
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ca->curr_rtt =3D sample->rtt_us;
 >> +=C2=A0 =C2=A0 }
 >> +}
 >
 > [Severity: Medium]
 > Does discarding valid 0-microsecond RTT samples completely disable ROCC=
ET
 > on ultra-low latency links?
 >
 > On loopback or ultra-low latency interfaces, sub-microsecond RTTs are
 > rounded down to 0. By ignoring them entirely instead of treating them a=
s
 > 1us, curr_rtt is prevented from ever initializing past U32_MAX,=20
permanently
 > breaking the congestion avoidance logic.
I do not know what to answer here. The TCP stack is not feasible to handle
latency below 1us.
Even on an internet path or a 10 gigabit LAN, there is no such low latency=
.

 > [ ... ]
 >> +static void roccet_drain_update(struct sock *sk, u32 now)
 >> +{
 >> +=C2=A0 =C2=A0 struct tcp_sock *tp =3D tcp_sk(sk);
 >> +=C2=A0 =C2=A0 struct roccettcp *ca =3D inet_csk_ca(sk);
 >> +
 >> +=C2=A0 =C2=A0 if (ca->roccet_last_event_time_us &&
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 time_after32(now, ca->roccet_last_event_t=
ime_us +
 >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0100 * USEC_PER_MSEC))=
 {
 >
 > [Severity: Medium]
 > Can this condition incorrectly fail if the connection idles for more th=
an
 > 35.7 minutes?
 >
 > Because now is a 32-bit microsecond timestamp, the subtraction in
 > time_after32() will exceed its signed boundary if the time elapsed is
 > greater than 2^31 microseconds. If an application idles and then resume=
s,
 > it could be incorrectly trapped in the DRAIN state, freezing window=20
growth
 > until the timer wraps again.
We will fix that.

